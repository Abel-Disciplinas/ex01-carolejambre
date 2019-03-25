# add Images
# add ImageMagick

using Images

# z^2 = x^2 + 2xyi - y^2 = (x^2 - y^2) + (2xy) i
function iteracao_mandelbrot(cx, cy)
  x = y = 0 
  for inter = 0:40
    a,b = x,y
    x = a^2 - b^2 + cx
    y = 2*a*b + cy
  end

  # AQUI

  if x^2 + y^2 < 4
    return false, 0
  else
    return true, 1
  end
end

function mandelbrot(N)
  x = range(-2.5, 1.5, length=N)
  y = range(-2.0, 2.0, length=N)

  imagem = zeros(N, N)
  for i = 1:N
    for j = 1:N
      estavel, ρ = iteracao_mandelbrot(x[i], y[j])
      if estavel
        imagem[i,j] = ρ
      end
    end
  end

  save("mandelbrot.jpg", imagem')
end

mandelbrot(1000)
