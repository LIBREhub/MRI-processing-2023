### A Pluto.jl notebook ###
# v0.19.32

using Markdown
using InteractiveUtils

# ╔═╡ 69cb9322-9a24-46f6-bea7-2d9cb4c335d6
import Pkg; Pkg.activate()

# ╔═╡ b83107f8-eebf-49ed-afd1-5237cfbf01af
begin
	using MAT
	using FFTW
    using Plots
	Dict_m = matread("C:\\Users\\ronal\\Desktop\\Taller_Suckerber\\Mk_parallelimaging.mat")
	M_kj = Dict_m["Mk"]
	m_xj = complex(zeros(size(M_kj)))
	#mask2 = ones(size(M_kj,2),size(M_kj,3))
	#mask2[1:4:end,:] = zeros(size(mask2[1:4:end,:]))
	for i in 1:size(M_kj,3)	
		m_xj[:,:,i] =  ifftshift(ifft( ifftshift(M_kj[:,:,i]) ),1)
	end
   
	
	p02 = heatmap(abs.(M_kj[:,:,1]) , c=:grays)
	
	p01 = heatmap([abs.(m_xj[:,:,1]) abs.(m_xj[:,:,2]); abs.(m_xj[:,:,3]) abs.(m_xj[:,:,4])], c=:grays)
	plot(p02,p01)
end

# ╔═╡ 35990690-7cb5-11ee-2143-87ea520648dd
md"# Hands on parallel imaging "

# ╔═╡ 6db4dd0a-6f88-49d8-8384-f1b1b8d01806
md"""
## Contenido

Este hands on consistirá de los siguientes temas:
* Suma de cuadrados y estimación de la sensibilidad de bobinas
* Operador de codificación $E$
* Recostrucción mediante codificación de la sensibilidad (SENSE: sensitivity encoding)
"""


# ╔═╡ 8ab7c6fe-818f-4b2e-bcae-0053f1a1a5d1
md"""
### Suma de cuadrados y estimación de la sensibilidad de bobinas

La suma de cuadrados es el método más común cuando el interes es la magnitud de la imagen. La imagens $m(x)$ resultante suma de cuadrados se define como:

$m(x) = \sqrt{\sum_{j} \frac{|m_{j}(x)|^2}{\sigma_{j}^{2}}}$

donde $\sigma_{j}$ es la varación del ruido en la bobina $j$, $m_{j}(x)$ es la imagen acquirida de cada bobina.

Una reconstrucción con mejor SNR viene dada por:

$m(x) = \frac{\sum_{j} S_{j}^{*}(x) m_{j}(x)}{\sum_{j} S_{j}^{*}(x)S_{j}(x)}$ 

donde $S_{j}$ es la sensibilidad de la $j$-esima bobina. Debido a la dificultad de estimar $S_{j}$, se usa mas sumas de cuadrados en la práctica. Sin embargo, cuando se quiere estimar la sensibilidad de manera rápida, se pueden combinar ambas ecuaciones para obtener la siguiente expresion:

$S_{j}(x) \approx \frac{m_{j}(x)}{\sqrt{\sum_{j} \frac{|m_{j}(x)|^2}{\sigma_{j}^{2}}}}$

A continuacion se le entregan datos acquiridos de un fantoma.  Haga un código que estime la sensibilidad de las bobinas suponiendo $\sigma_{j} = 1$
"""


# ╔═╡ f0d2084c-9005-4c80-aa79-33ca632c07bc
md"""
#### Primer ejercicio:

A continuacion se le entregan datos acquiridos de un fantoma.  Haga un código que estime la sensibilidad de las bobinas suponiendo $\sigma_{j} = 1$
"""

# ╔═╡ 2942505d-2a35-4456-8b52-101988de9713
md"""
### Operador de codificación $E$

El problema de recontrucción paralela se puede plantear como el siguiente problema lineal:

$Em(x)=M(k)$

donde m(x) es la imagen que buscamos, $E$ es el operador de codifición del espacio k, y M(k) son los datos adquiridos. El operador $E$ se define como:

$E = UFS$

donde $U$ es la mascara de submuestreo, $F$ la transformada de Fourier y $S$ la sensibilidad de la bobina. Entonces, se busca conseguir $m(x)$ que satisface:

$E^{H}Em(x)=E^{H}M(k)$

donde $E^{H}$ es la transpuesta hermitiana de $E$. 

###### Ejercicio: Construya el tanto el operador $E^{H}$ como $E$.
"""

# ╔═╡ 0a1a5495-8f0e-491d-af46-27ea59642e9d
md"""
### Recostrucción mediante codificación de la sensibilidad (SENSE: sensitivity encoding)

###### Ejercicio: Construya una solucion al problema $E^{H}Em(x)=E^{H}M(k)$ usando gradiente conjugado para conseguir el $m(x)$.
"""

# ╔═╡ a16fbe08-7c8e-4a17-b1a6-d1b00ddc9358
begin
	#B_cg = vec(M_kj);
	
	# Residual
	#r0 = complex(vec(zeros(size(Sj,1), size(Sj,1))));
	local r1 = complex(vec(zeros(size(Sj,1), size(Sj,2))));
	
	# Resulting image
	local x11 =  complex(vec(zeros(size(Sj,1),size(Sj,2))));
	local x01 =  complex(vec(zeros(size(Sj,1),size(Sj,2))));
	
	# Error and convergence history
	# error = 1e-3 + 1.0; 
	
	# Initial estimation of r0
	local r0 = Eh(Sj,mask,M_kj) - Eh(Sj,mask,E(Sj,mask,x11))
	local p0 = copy(r0);
	
	# Solves the problem
    i = 0;
	max_it = 100
	while i < max_it
	    # Iteration
   		 global i += 1

			
	    # Calculate alpha
	    tmp0 =  Eh(Sj,mask,E(Sj,mask,p0))
	    alpha = r0'*r0./(p0'*tmp0);
	
	    # Estimate image and update residual
	    x11 = x01 + alpha*p0;
	    r1 = r0 - alpha*tmp0;
	
	 
	    beta = r1'*r1/(r0'*r0);
	    p1 = r1 + beta*p0;
	
	    # error estimation
	   # error = norm(abs.(x11) - abs.(x01), 2);
	
	    # Update
	    x01 = copy(x11);
	    p0 = copy(p1);
	    r0 = copy(r1);	

	end
	heatmap(abs.(reshape(x01,size(Sj,1),size(Sj,2))) , c=:grays)
end


# ╔═╡ Cell order:
# ╟─35990690-7cb5-11ee-2143-87ea520648dd
# ╟─6db4dd0a-6f88-49d8-8384-f1b1b8d01806
# ╟─8ab7c6fe-818f-4b2e-bcae-0053f1a1a5d1
# ╟─f0d2084c-9005-4c80-aa79-33ca632c07bc
# ╠═69cb9322-9a24-46f6-bea7-2d9cb4c335d6
# ╠═b83107f8-eebf-49ed-afd1-5237cfbf01af
# ╠═2942505d-2a35-4456-8b52-101988de9713
# ╠═0a1a5495-8f0e-491d-af46-27ea59642e9d
# ╠═a16fbe08-7c8e-4a17-b1a6-d1b00ddc9358
