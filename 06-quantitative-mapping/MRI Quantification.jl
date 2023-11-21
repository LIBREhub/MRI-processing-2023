### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ ec5486ca-28bd-4e79-80b2-502aa6beda63
begin
	using Pkg
	Pkg.activate()
	using PlutoUI
	TableOfContents()
end

# ╔═╡ 0349f875-efa5-400f-b539-dc377b14f2b8
begin
	
	using Plots
	plotly() # Para activar PlotlyJS en Plots
	using KomaMRI, PlutoPlotly, KomaMRIPlots, KomaMRICore
	using MAT
	using GLM
	using DataFrames
end

# ╔═╡ a8b47f28-3ee5-4074-ba84-b1487a154826
md"# Hands-on: Quantitative Mapping
¡Bienvenido!

En este _hands-on_ nos dedicaremos a estudiar cómo algunas herramientas matemáticas pueden ayudarnos a cuantificar propiedades físicas de los tejidos y determinar las constantes de relajación.
"

# ╔═╡ 61916d5c-cc4e-4f54-b7eb-56aa2a096d19
md"
## Prefacio
Las siguientes celdas cargan el entorno local de Julia para que los paquetes sean cargados en el entorno.

"

# ╔═╡ e22b665d-7d6f-4301-9c2b-7bd0d560b40e
md"""
# Introducción
Imaginemos por un instante que tenemos a disposición un conjunto llamado $I$ que contiene $N$ imágenes y que fueron obtenidas a través de las mismas secuencias aplicadas al mismo objeto. Si las configuraciones de secuencia son conocidas (TE, TR, etc.), entonces, podríamos identificar las constantes de relajación cuando cumplimos condiciones en las que los efectos son conocidos. 

A manera de ejemplo, aunque no relacionado a secuencia alguna, si tuvieramos un modelo como 

$$f(c_1, c_2)= \frac{k_1}{100} c_1 + \frac{k_2}{100} c_2$$

Si $k_1=1$ y $k_2=100$, entonces el efecto de la variable $c_1$ es mayor que $c_2$ en razón de 100 a 1. De todas formas, en la práctica, necesitamos varias lecturas de $f(c_1,c_2)$ para que la estimación de $c_1$ o $c_2$ sea significativa.

En el contexto de MRI, esto significa que para estimar constantes de relajación, necesitamos varias imágenes obtenidas bajo condiciones conocidas. Si las condiciones proporcionan mayor influencia a alguna constante de relajación, como - por ejemplo - T1, se dice que la imagen es ponderada en T1 (**T1 weighted**).
"""

# ╔═╡ cfcf3102-49ee-464b-872b-04d449a95163
md"# 1. Ajuste por regresión lineal

En esta sección, a manera introductoria, encontraremos el parámetro $m$ del siguiente modelo

$$f(x) = mx + b$$

Trabajaremos con dos tipos de datos, ruidosos y no ruidosos.

Primero, creamos dos funciones que nosotros conocemos, pero que luego aproximaremos usando solo datos de $f(x)$ y $x$:

1. ``f_{clean}(x)=mx+b``
2. ``f_{noisy}(x)=mx+b+\eta`` ; el ruido es introducido en ``\eta``

En código sería:
"

# ╔═╡ fce8e6d6-6220-48ef-abb0-fa5cb8b17985
begin 
	m = 3.5;
	b = 1;
	f_clean(x) = m.*(x) .+ b;
	f_noisy(x) = m.*x .+ b + rand(-m/2:m/2, size(x)[1],1);
end

# ╔═╡ 1887343a-4ee7-4ea4-9dea-2e68f6b657c6
md"
Ahora, definimos los datos para los que encontraremos $f(x)$:
"

# ╔═╡ 3af71b8a-5c8a-477d-9f06-e0491c2d2641
x = 1:10;

# ╔═╡ 131c2f33-2d80-42e3-8d68-924835d879de
md"Grafiquemos la función:"

# ╔═╡ e79ce05e-2759-4362-9956-66a2aaf765b7
Plots.scatter(x,f_clean(x), title="f_{clean}")

# ╔═╡ f21fba91-f033-47c9-bfde-dd4c6282f347
Plots.scatter(x, f_noisy(x), title="f_noisy")

# ╔═╡ acad14f6-3cf7-450b-9755-831b5ff3c3fa
md"Para implementar la regresión lineal, nos remitimos a la función `lm` del paquete GLM. Sin embargo, antes, definitmos un _data frame_ para los datos limpios:"

# ╔═╡ b5940e4b-b77a-4285-a54b-e894e5271c9a
data_clean = DataFrame(X=x, Y=f_clean(x))

# ╔═╡ 83fb5dec-7f40-4632-972c-e60692095fdd
md"Y para los datos ruidosos:"

# ╔═╡ 27a5df91-9fe8-4f8e-8ef1-9ed759e78451
data_noisy = DataFrame(X=x, Y=f_noisy(x)[:,1])

# ╔═╡ 6300e9b1-576b-4e0b-9d10-2ecbce11bbcc
md"Ahora usamos `lm` y encontramos que los coeficientes se ajustan a los valores de $m = 3.5$ y $b = 1$ - como anteriormente fueron definidos. Los errores son muy bajos, como se observa. "

# ╔═╡ f37cc33e-0179-4136-b8c7-da4a78e54fc6
line_clean = lm(@formula(Y ~ X), data_clean)

# ╔═╡ 685bffc6-91d1-4967-adc6-1c77db30842c
md"Usando el caso de los datos ruidosos nos encontramos con que la estimación ya no se parece completamente a $m=3.5$ y $b=1$. En cambio, estos dependerán enteramente de cuáles fueron los valores aleatorios generados.

*Importante - cada vez que ejecutas la celda donde `data_noisy` es definido, esta celda también cambiará.*"

# ╔═╡ 2e9350d5-fbfe-4df5-b619-78bf2118407a
line_noisy = lm(@formula(Y ~ X), data_noisy)

# ╔═╡ ecb7671f-119b-4846-94d1-c786cae18185
md"Para comparar los modelos podemos usar `predict`:"

# ╔═╡ 4515d0d4-59ac-49c6-bd57-5f68666cd751
begin
	Plots.plot(x, [data_noisy.Y, predict(line_noisy), data_clean.Y], label=["Datos originales" "Ajuste por regresión" "Datos limpios"])
	plot!(legend=:outerbottom)
end

# ╔═╡ a765b911-bfbc-4c83-b85e-9b1c9d3c1e94
md"
!!! ejercicio
	Utiliza dos conjuntos de 991 datos, uno con ruido y otro sin ruido. Tu trabajo será interpretar correctamente los datos para que así te sea posible identificar el parámetro ``a`` en: 

	$$g(t) = te^a + 2$$

	**Importante** - Las siguientes celdas pueden ser ejecutadas, pero no proporcionan el resultado correcto.

	Las siguientes celdas descargan los conjuntos de datos y los cargan al entorno:
"

# ╔═╡ 92931fe8-af29-4a52-a6e1-87f06797dc70
download("https://github.com/LIBREhub/MRI-processing-2023/raw/main/06-quantitative-mapping/data_clean.mat","./d_data_clean.mat")

# ╔═╡ 6ccc1b93-a216-43a2-9849-532f6b81c94c
download("https://github.com/LIBREhub/MRI-processing-2023/raw/main/06-quantitative-mapping/data_noisy.mat","./d_data_noisy.mat")

# ╔═╡ 4708eed6-dcc0-456c-9e9d-f21ce6e66a5f
begin
		
	file = matopen("./d_data_clean.mat")
	t_clean = read(file, "t_clean")' # El ' traspone el vector para compatibilizar con las siguientes operaciones
	g_clean = read(file, "f_clean")'
	close(file)
	
	file = matopen("./d_data_noisy.mat")
	g_noisy = read(file, "f_noisy")'
	close(file)
	
end

# ╔═╡ d95bb056-b91f-4e2e-ae7e-7ee469b01192
Plots.plot(t_clean, [g_clean, g_noisy], label=["Datos limpios" "Datos con ruido"])

# ╔═╡ 2e3cda4a-64f1-4e16-936f-1b02d01aed23
md"Creamos dos `DataFrame` para guardar los datos."

# ╔═╡ 51e21476-7769-4d38-98ad-449b35810dcf
begin
	new_clean = DataFrame(X=t_clean[:,1], Y=g_clean[:,1]);
	new_noisy = DataFrame(X=t_clean[:,1], Y=g_noisy[:,1]);
end

# ╔═╡ b4f67ce2-d053-4b09-81d7-8d52d99b8d5d
 md"Y aplicamos la regresión lineal mediante `lm` tanto para los datos limpios como para los datos ruidosos."

# ╔═╡ 7b4c64f2-1664-400d-96de-17525007b9ab
new_lm_clean = lm(@formula(Y ~ X), new_clean)

# ╔═╡ da5bda98-868e-4c1c-b598-f3bae7564edd
new_lm_noisy = lm(@formula(Y ~ X), new_noisy)

# ╔═╡ 2049a70f-39ea-4706-9951-af539e38b039
md"De ``g(t)=te^a+2``, sabemos que al ajustar a ``y=mx+b``, ``m=e^a``, ``t=x`` y ``b=2``, por ende, tenemos"

# ╔═╡ ea17490e-b71e-4683-a781-cbb87cf5bcad
begin
	# debes modificar la siguiente línea
	a_clean = coeftable(new_lm_clean).cols[1][2]; # coeftable extrae los coeficientes y los indices [1][2] apuntan al valor de coeficiente X del modelo, es decir, a `m` de y=mx+b
	# debes modificar la siguiente línea
	a_noisy = coeftable(new_lm_noisy).cols[1][2];
	g_c(t) = t.*exp(a_clean) .+ 2;
	g_n(t) = t.*exp(a_noisy) .+ 2;
end

# ╔═╡ 937848a9-6a2a-40cc-8626-87affe8e9382
md"Lo que puede ser comprobado aquí:"

# ╔═╡ 963ab0d0-ab4d-4381-a3f1-a5dac9499417
begin
	Plots.plot(t_clean, [g_clean, g_c(t_clean), g_n(t_clean)], label=["Datos limpios originales" "Datos limpios del ajuste" "Datos ruidos ajustados"])
	plot!(legend=:outerbottom)	
end

# ╔═╡ b4b9f04a-8066-4bf4-a9be-a26669db2f94
md"Y verificado con el cuadrado de las diferencias:"

# ╔═╡ fe45d614-aaaa-402d-a099-42aa109ef55b
begin
	Plots.plot(t_clean, [(g_clean - g_c(t_clean)).^2, (g_clean - g_n(t_clean)).^2], label=["Error con modelo limpio" "Error con modelo ruidoso"])
	plot!(legend=:outerbottom)
end

# ╔═╡ 371a7d18-f6f1-4e62-889c-0b2865230329
md"
!!! importante 
	El resultado es: ``a=3``. Lo ponemos acá para que sepas si tu implementación salió bien, no para que lo copies
"

# ╔═╡ bc0e8785-72a7-48b8-ab73-3775ede56170
md"# 2. Cuantificación 

Ahora hagamos nuestro ejercicio más realista. En Campbell-Washburn, A. E. et al. (2019), se indica que a 1.5T, T1 y T2 para el miocardio pueden ser 1000ms y 50ms, respectivamente. Entonces, creamos una secuencia simple de excitación de 90° (empleando amplitud de RF a 2uT), con 8192 muestras adquiridas durante 1ms (`durADC`), aplicada a un fantoma con un solo spin en ``x=0`` con las características mencionadas.

**Importante** - La simulación puede tomar un momento.
"

# ╔═╡ e1df2acf-7941-49ba-b57c-2250d09fc0d0
begin
	sys = Scanner()
	ampRF = 2e-6                        # 2 uT RF amplitude
	durRF = π / 2 / (2π * γ * ampRF)    # required duration for a 90 deg RF pulse
	exc = RF(ampRF,durRF)
	nADC = 128         					# number of acquisition samples
	durADC = 250e-3     				# duration of the acquisition
	delay =  1e-3       				# small delay
	acq = ADC(nADC, durADC, delay)
	seq = Sequence()  					# empty sequence
	seq += exc        					# adding RF-only block
	seq += acq        					# adding ADC-only block
	obj = Phantom{Float64}(x=[0.], T1=[1000e-3], T2=[50e-3])
	raw = simulate(obj, seq, sys)
end


# ╔═╡ eda47fdc-01f5-4e1f-a066-a0b2ef586319
md"La secuencia es simple y se ve así:"

# ╔═╡ 12c2340e-ae8f-4ede-a7a3-d74d59f25d26
# ╠═╡ disabled = true
#=╠═╡
 plot_seq(seq;  height=300)
  ╠═╡ =#

# ╔═╡ 317f6d6e-93c0-4722-b7c3-190ac6990bd2
md"Asimismo, la señal se ve de esta forma:"

# ╔═╡ 730f15ef-7f02-440b-abbe-c99cf4fc101c
plot_signal(raw; slider=false, height=300)

# ╔═╡ 715f7b27-1363-4c5b-9486-8b4afcbc773b
md"Con esta señal, podemos ajustar el modelo de relajación T2, i.e.,
$$S(t)\propto e^{-t/T_2}$$

Para ello, usamos dos puntos que podrían ser:

1. 0.260 aU - 68.8956ms
2. 0.109 aU - 112.2027ms

Por otro lado, dado que el modelo sería

$$f(t) = e^{-t/T_2}$$

y deseamos identificar ``T_2``, linealizamos a

$$\log f(t) = \frac{-t}{T_2}$$

Por lo que en analogía con ``y=mx + b``, ``y=\log f(t)``, ``x = t``, ``m = -\frac{1}{T_2}``

**Importante** - En la práctica, con dos puntos la determinación no es para nada confiable, así que se utilizan cuantos puntos sean posible. _Sin embargo_, en la práctica, también, dado que cada adquisición toma tiempo, se busca que no sea necesario adquirir muchas veces. Es decir, existe un **trade-off** entre el número de muestras y la duración del examen.

"

# ╔═╡ 25b1719c-7c5c-431a-821d-8e1e67e4fdbc
FID_id = DataFrame(X=[68.8956e-3, 112.2027e-3], Y=[log(0.260), log(0.109)]);

# ╔═╡ f2c62600-797a-416f-9074-d42571836ab9
LM_FID = lm(@formula(Y ~ X), FID_id)

# ╔═╡ 411c8032-6ff4-40d3-93ea-abbceb88f752
md"De ahí, sigue que 

$$T_2 = -\frac{1}{m}$$

"

# ╔═╡ 6df77b9d-dcbb-4669-9652-eee4e35e6ce3
FID_T2 = -1/(coeftable(LM_FID).cols[1][2])

# ╔═╡ 8201ef85-b37c-4e23-ad28-0687b4e66c29
md"
Como se ve, la identificación es posible para el fenómeno de Free Induction Decay (FID) - aunque no es precisamente 50ms, pero si es aproximado.
"

# ╔═╡ e4d4b0ce-45ae-4cba-ab8e-83a95df64bc3
md"
!!! ejercicio 
	Utiliza el código que se encuentra abajo para que la identificación de T2 sea correcta. La celda se ejecuta, pero produce resultados incorrectos.
	**Importante** 
	
	- KomaMRICore.get_adc_sampling_times(seq) - retorna los tiempos a los cuales fueron adquiridas las muestras.
	- real(raw_2.profiles[1].data * -1im) - retorna los valores reales que fueron adquiridos.
"

# ╔═╡ 15007c03-f584-45ad-a8e4-d19551d1d9c4
begin
	T2_target = 99e-3
	obj_2 = Phantom{Float64}(x=[0.], T1=[1100e-3], T2=[T2_target])
	raw_2 = simulate(obj_2, seq, sys)
	plot_signal(raw_2; slider=false, height=300)
	# Debes cambiar la siguiente línea
	time_values = log.(KomaMRICore.get_adc_sampling_times(seq))
	# Debes cambiar la siguiente línea
	signal_values = real(raw_2.profiles[1].data * -1im)
	FID_id_2 = DataFrame(X=time_values, Y=convert(Vector{Float64}, signal_values[:,1]));
	LM_FID_2 = lm(@formula(Y ~ X), FID_id_2)
	FID_T2_2 = -1/(coeftable(LM_FID_2).cols[1][2])
	println("El T2 identificado es: ", FID_T2_2, " y debería ser ", T2_target)
end


# ╔═╡ f5db362e-9855-4591-81cc-f5133ef397e5
md"
!!! importante

	En esta ocasión usamos una simulación sin ruido y de un solo spin, cuando realizamos la cuantificación en un entorno real, existe mucho ruido y no con un solo spin. El resultado de considera condiciones realistas es que la cuantificación no es una tarea sencilla y sigue siendo un campo abierto de investigación.
"

# ╔═╡ fc87ffaf-94b4-47ba-beda-47e8ba8c9336
md"# 3. Imágenes ponderadas (o pesadas) en T1 y en T2

Pero no estamos contentos con un spin, ¡usemos un fantoma para crear una imagen!

Como primer paso para obtener imágenes ponderadas en T2, podemos usar secuencias Spin-Echo, así que ahora definimos la secuencia. No es necesario que cambies algo, pero si deseas, puedes hacerlo luego.

De todas maneras, cuando se usa una secuencia Spin Echo, es usual ver las siguientes configuraciones dependiendo de qué se busca resaltar:

* Para ponderación en T1 - Tiempos de repetición cortos y tiempos de eco cortos.
* Para ponderación en T2 - Tiempos de repetición largos y tiempos de eco largos.

Para entender más fácilmente a qué nos referimos con los tiempos de repetición (TR) y los tiempos de eco (TE), es mejor referirnos a esta imagen (de https://www.radiologycafe.com):

![img](https://www.radiologycafe.com/wp-content/uploads/2021/04/mri-spinecho.png)

"

# ╔═╡ f09ffeca-2803-4ea0-b3ee-e4e30b777dae
begin
	seq_se_T2 = Sequence()
	Ny = 64
	Nx = 64
	TR_T2 = 3500e-3
	TE_T2 = 330e-3
	t_90 = π / 2 / (2π * γ * ampRF)
	exc_90 = RF(ampRF, t_90)
	t_180 = π / (2π * γ * ampRF)
	exc_180 = RF(ampRF, t_180) # \pi por el 180°
	t_acq = 0.09e-3
	for i=1:50
		seq_se_T2 = seq_se_T2 + exc_90
		seq_se_T2 = seq_se_T2 + Delay(TE_T2/2-t_180/2-t_90/2)
		seq_se_T2 = seq_se_T2 + exc_180
		seq_se_T2 = seq_se_T2 + Delay(TR_T2 - TE_T2/2 - t_90/2 - t_180/2)
	end	
	Gyp = 30e-3
	Gyi = 2*Gyp/Ny
	t_r = 0.01e-3
	t_p = 0.09e-3
	Gypx = Gyp * (t_p + t_r)/(t_acq/2 + t_r/2)
	adc_block = Sequence([Grad(Gypx, t_acq, t_r); Grad(0e-3, t_acq, t_r); Grad(0e-3, t_acq, t_r);;], [RF(0, t_acq);;], [ADC(Nx, t_acq, t_r)])
	for i=1:Ny
		seq_se_T2 = seq_se_T2 + exc_90
		phase_amplitude = -Gyp + (i - 1) * Gyi
		g_pe = [Grad(Gyp, t_p, t_r); Grad(phase_amplitude, t_p, t_r); Grad(0e-3, t_p, t_r);;]
		seq_se_T2 = seq_se_T2 + Sequence(g_pe)
		seq_se_T2 = seq_se_T2 + Delay(TE_T2/2 - t_180/2 - t_r - t_p - t_r - t_90/2)
		seq_se_T2 = seq_se_T2 + exc_180
		seq_se_T2 = seq_se_T2 + Delay(TE_T2/2 - t_180/2 - t_r - t_acq/2)
		seq_se_T2 = seq_se_T2 + adc_block
		seq_se_T2 = seq_se_T2 + Delay(TR_T2-TE_T2/2 - t_90/2 - t_acq/2 - t_r)
	end
	
end

# ╔═╡ c2e36428-88f4-4b0a-a66c-3c47c05050bf
md"La secuencia se ve así y consta de una parte en la que se induce la respuesta en estado estacionario, y otra en la que se recorre el espacio K mientras se adquieren las muestras."

# ╔═╡ c5014021-c81f-4e7e-8ecf-4cd1f8b3bba6
plot_seq(seq_se_T2; height=300)

# ╔═╡ 6c768974-e4cf-4ed9-ba73-70eab722a144
md"En efecto, la trayectoria de la secuencia puede visualizarse en la siguiente imagen y es posible apreciar que es simétrica alrededor del origen, como también siguiendo una forma cartesiana."

# ╔═╡ 13bacfee-3ff8-4540-a63f-0c0d496a7f23
plot_kspace(seq_se_T2)

# ╔═╡ 71e54fa7-2680-4257-8079-b298dde3df64
md"Finalmente, simulamos la secuencia en el fantoma de cerebro y reconstruimos la imagen. La imagen es de 64x64, por lo que, la resolución es muy pequeña como para ver muchos detalles - pero sirve al propósito de verificar que la secuencia es funcional."

# ╔═╡ fc5443d6-6815-48a1-b980-1ec6f2a94951
begin 
	obj3 = brain_phantom2D();
	raw_phantom_T2 = simulate(obj3, seq_se_T2, sys)
	acq_data_T2 = AcquisitionData(raw_phantom_T2)
	reconParams = Dict{Symbol,Any}(:reco=>"direct", :reconSize=>(Nx, Ny));
	reconstructed_image_T2 = reconstruction(acq_data_T2, reconParams);
	slice_abs_T2 = abs.(reconstructed_image_T2[:, :, 1]);
	plot_image(slice_abs_T2, title="Reconstructed Image T2 weighted")
end

# ╔═╡ e760fce5-9022-4b12-9ec5-7ca6ac8c452c
md"Las imágenes ponderadas (o pesadas) en T1 o en T2 tienen características bien estudiadas. Un ejemplo se encuentra en la siguiente imagen (https://case.edu/med/neurology/NR/MRI%20Basics.htm):
![img](https://case.edu/med/neurology/NR/t1t2flairbrain.jpg)
Donde evidentemente existen ciertas similitudes con nuestra simulación. Ahora exploremos qué pasa con una secuencia pesada en T1.
"

# ╔═╡ 697c1aa3-7d86-468f-87f3-dff16aadbe6f
md"
!!! ejercicio
	Utiliza los códigos anteriores y cambia los valores de TR y TE para generar una imagen pesada en T1; a manera de guía, la proporción entre TR y TE puede ser de 6 a 1 y menores a un seg]undo. 
"

# ╔═╡ dba71361-5f8d-4fd8-abc1-05ed35b48524
begin
	seq_se_T1 = Sequence()
	# Debes cambiar este valor
	TR_T1 = 3500e-3
	# Debes cambiar este valor
	TE_T1 = 330e-3
	for i=1:50
		seq_se_T1 = seq_se_T1 + exc_90
		seq_se_T1 = seq_se_T1 + Delay(TE_T1/2-t_180/2-t_90/2)
		seq_se_T1 = seq_se_T1 + exc_180
		seq_se_T1 = seq_se_T1 + Delay(TR_T1 - TE_T1/2 - t_90/2 - t_180/2)
	end	
	for i=1:Ny
		seq_se_T1 = seq_se_T1 + exc_90
		phase_amplitude = -Gyp + (i - 1) * Gyi
		g_pe = [Grad(Gyp, t_p, t_r); Grad(phase_amplitude, t_p, t_r); Grad(0e-3, t_p, t_r);;]
		seq_se_T1 = seq_se_T1 + Sequence(g_pe)
		seq_se_T1 = seq_se_T1 + Delay(TE_T1/2 - t_180/2 - t_r - t_p - t_r - t_90/2)
		seq_se_T1 = seq_se_T1 + exc_180
		seq_se_T1 = seq_se_T1 + Delay(TE_T1/2 - t_180/2 - t_r - t_acq/2)
		seq_se_T1 = seq_se_T1 + adc_block
		seq_se_T1 = seq_se_T1 + Delay(TR_T1-TE_T1/2 - t_90/2 - t_acq/2 - t_r)
	end
	 
	raw_phantom_T1 = simulate(obj3, seq_se_T1, sys)
	acq_data_T1 = AcquisitionData(raw_phantom_T1)
	reconstructed_image_T1 = reconstruction(acq_data_T1, reconParams);
	slice_abs_T1 = abs.(reconstructed_image_T1[:, :, 1]);
	plot_image(slice_abs_T1, title="Reconstructed Image T1 weighted")

end

# ╔═╡ a84e95ae-2977-439e-8cc5-aae158ac3351
md"
!!! conclusion

	¡Bien!
	Las imágenes son buenas, pero no las hemos cuantificado. Para cuantificarlas, sin embargo, se sigue la misma lógica que en la sección 2. Es decir, dadas varias imágenes obtenidas a distintos tiempos de eco, ajustar el modelo de T2 que refleja la secuencia en una forma de pixel a pixel. 
"

# ╔═╡ fb9ea51a-a73d-4220-b1fe-8b8b51e303ff
md"# Epílogo

Referencias:

1. Campbell-Washburn, A. E., Ramasawmy, R., Restivo, M. C., Bhattacharya, I., Basar, B., Herzka, D. A., Hansen, M. S., Rogers, T., Bandettini, W. P., McGuirt, D. R., Mancini, C., Grodzki, D., Schneider, R., Majeed, W., Bhat, H., Xue, H., Moss, J., Malayeri, A. A., Jones, E. C., … Balaban, R. S. (2019). Opportunities in Interventional and Diagnostic Imaging by Using High-Performance Low-Field-Strength MRI. Radiology, 293(2), 384–393. https://doi.org/10.1148/radiol.2019190452

Lecturas recomendadas:
1. Panda A, Mehta BB, Coppo S, Jiang Y, Ma D, Seiberlich N, Griswold MA, Gulani V. Magnetic Resonance Fingerprinting-An Overview. Curr Opin Biomed Eng. 2017 Sep;3:56-66. doi: 10.1016/j.cobme.2017.11.001. PMID: 29868647; PMCID: PMC5984038.
"

# ╔═╡ Cell order:
# ╟─a8b47f28-3ee5-4074-ba84-b1487a154826
# ╟─61916d5c-cc4e-4f54-b7eb-56aa2a096d19
# ╠═ec5486ca-28bd-4e79-80b2-502aa6beda63
# ╠═0349f875-efa5-400f-b539-dc377b14f2b8
# ╟─e22b665d-7d6f-4301-9c2b-7bd0d560b40e
# ╟─cfcf3102-49ee-464b-872b-04d449a95163
# ╠═fce8e6d6-6220-48ef-abb0-fa5cb8b17985
# ╟─1887343a-4ee7-4ea4-9dea-2e68f6b657c6
# ╠═3af71b8a-5c8a-477d-9f06-e0491c2d2641
# ╟─131c2f33-2d80-42e3-8d68-924835d879de
# ╠═e79ce05e-2759-4362-9956-66a2aaf765b7
# ╠═f21fba91-f033-47c9-bfde-dd4c6282f347
# ╟─acad14f6-3cf7-450b-9755-831b5ff3c3fa
# ╠═b5940e4b-b77a-4285-a54b-e894e5271c9a
# ╟─83fb5dec-7f40-4632-972c-e60692095fdd
# ╠═27a5df91-9fe8-4f8e-8ef1-9ed759e78451
# ╟─6300e9b1-576b-4e0b-9d10-2ecbce11bbcc
# ╠═f37cc33e-0179-4136-b8c7-da4a78e54fc6
# ╟─685bffc6-91d1-4967-adc6-1c77db30842c
# ╠═2e9350d5-fbfe-4df5-b619-78bf2118407a
# ╟─ecb7671f-119b-4846-94d1-c786cae18185
# ╠═4515d0d4-59ac-49c6-bd57-5f68666cd751
# ╟─a765b911-bfbc-4c83-b85e-9b1c9d3c1e94
# ╠═92931fe8-af29-4a52-a6e1-87f06797dc70
# ╠═6ccc1b93-a216-43a2-9849-532f6b81c94c
# ╠═4708eed6-dcc0-456c-9e9d-f21ce6e66a5f
# ╠═d95bb056-b91f-4e2e-ae7e-7ee469b01192
# ╟─2e3cda4a-64f1-4e16-936f-1b02d01aed23
# ╠═51e21476-7769-4d38-98ad-449b35810dcf
# ╟─b4f67ce2-d053-4b09-81d7-8d52d99b8d5d
# ╠═7b4c64f2-1664-400d-96de-17525007b9ab
# ╠═da5bda98-868e-4c1c-b598-f3bae7564edd
# ╟─2049a70f-39ea-4706-9951-af539e38b039
# ╠═ea17490e-b71e-4683-a781-cbb87cf5bcad
# ╠═937848a9-6a2a-40cc-8626-87affe8e9382
# ╠═963ab0d0-ab4d-4381-a3f1-a5dac9499417
# ╟─b4b9f04a-8066-4bf4-a9be-a26669db2f94
# ╠═fe45d614-aaaa-402d-a099-42aa109ef55b
# ╟─371a7d18-f6f1-4e62-889c-0b2865230329
# ╟─bc0e8785-72a7-48b8-ab73-3775ede56170
# ╠═e1df2acf-7941-49ba-b57c-2250d09fc0d0
# ╟─eda47fdc-01f5-4e1f-a066-a0b2ef586319
# ╠═12c2340e-ae8f-4ede-a7a3-d74d59f25d26
# ╟─317f6d6e-93c0-4722-b7c3-190ac6990bd2
# ╠═730f15ef-7f02-440b-abbe-c99cf4fc101c
# ╟─715f7b27-1363-4c5b-9486-8b4afcbc773b
# ╠═25b1719c-7c5c-431a-821d-8e1e67e4fdbc
# ╠═f2c62600-797a-416f-9074-d42571836ab9
# ╟─411c8032-6ff4-40d3-93ea-abbceb88f752
# ╠═6df77b9d-dcbb-4669-9652-eee4e35e6ce3
# ╟─8201ef85-b37c-4e23-ad28-0687b4e66c29
# ╟─e4d4b0ce-45ae-4cba-ab8e-83a95df64bc3
# ╠═15007c03-f584-45ad-a8e4-d19551d1d9c4
# ╠═f5db362e-9855-4591-81cc-f5133ef397e5
# ╟─fc87ffaf-94b4-47ba-beda-47e8ba8c9336
# ╠═f09ffeca-2803-4ea0-b3ee-e4e30b777dae
# ╟─c2e36428-88f4-4b0a-a66c-3c47c05050bf
# ╠═c5014021-c81f-4e7e-8ecf-4cd1f8b3bba6
# ╟─6c768974-e4cf-4ed9-ba73-70eab722a144
# ╠═13bacfee-3ff8-4540-a63f-0c0d496a7f23
# ╟─71e54fa7-2680-4257-8079-b298dde3df64
# ╠═fc5443d6-6815-48a1-b980-1ec6f2a94951
# ╠═e760fce5-9022-4b12-9ec5-7ca6ac8c452c
# ╟─697c1aa3-7d86-468f-87f3-dff16aadbe6f
# ╠═dba71361-5f8d-4fd8-abc1-05ed35b48524
# ╟─a84e95ae-2977-439e-8cc5-aae158ac3351
# ╟─fb9ea51a-a73d-4220-b1fe-8b8b51e303ff
