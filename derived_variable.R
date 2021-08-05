df <- data.frame(math = c(100,50,90),
                 korean = c(90, 100, 80))

df

df$sum <- df$math+df$korean
df

df$mean <- df$sum / 2
df