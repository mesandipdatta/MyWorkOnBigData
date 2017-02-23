#Rosettes
#A rosette is a figure obtained by taking n points equally spaced
#around the circumference of circle, and joining every point to
#every other point.

n = 17
theta = seq(0, 2 * pi, length = n + 1)[1:n]
x = sin(theta)
y = cos(theta)
plot.new()
plot.window(xlim = c(-1, 1),
              ylim = c(-1, 1),
              asp = 1)
for(i in 2:n)
for(j in 1:(i - 1))
    segments(x[i], y[i], x[j], y[j])
title(main="A 17-Rosette")

