test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,100,85,70))

test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70, 90, 95, 100, 80))

test1
test2

# left_join()으로 데이터 가로 병합
total <- left_join(test1, test2, by="id")
total

# bind_rows()으로 세로 병합
group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(90,75,85,95,90))

group_all <- bind_rows(group_a, group_b)
group_all