loglik.exp.plot <- function (X, poss = NULL, plot.likfunc = TRUE, plot.density = TRUE, 
    plot.calc = FALSE, xlab = NULL, ylab = NULL, conv = 0.01, 
    anim = TRUE, est.col = 2, density.leg = TRUE, cex.leg = 0.9, interval = 0.01, ...) 
{
    possibilities <- poss
    if (is.null(poss)) {
        possibilities <- seq(conv, mean(X) + (sd(X) * 2), min(conv, 
            0.01))
        logl <- possibilities
    }
    if (!is.null(poss)) 
        possibilities <- poss[poss != 0]
    logl <- possibilities
    for (i in 1:length(possibilities)) {
        logl[i] <- log(prod(dexp(X, 1/possibilities[i])))
    }
    max.p <- ifelse(is.null(poss), mean(X), possibilities[logl == 
        max(logl)][1])
    MLE <- mean(X)
    Max.lik <- log(prod(dexp(X, 1/mean(X))))
    if (anim == FALSE) {
        if (plot.likfunc == TRUE & plot.density == TRUE) {
            dev.new(height = 4, width = 8)
            par(mfrow = c(1, 2), mar = c(4.4, 4.5, 1, 0.5), cex = 0.9)
            layout(matrix(c(1, 2), 1, 2, byrow = TRUE))
        }
        if (plot.likfunc == TRUE) {
            plot(possibilities, logl, type = "l", ylab = ifelse(is.null(ylab), 
                "Exponential Log-likelihood function", ylab), 
                xlab = ifelse(is.null(xlab), expression(paste("Estimates for ", 
                  theta)), xlab), ...)
            legend("topright", legend = bquote(paste("ML est. = ", 
                .(MLE))), cex = cex.leg, bty = "n")
            abline(v = mean(X), lty = 2, col = est.col)
        }
        if (plot.density == TRUE) {
            x <- NULL
            rm(x)
            curve(dexp(x, 1/mean(X)), from = min(X), to = max(X), 
                xlab = expression(italic(x)), ylab = expression(paste(italic(f), 
                  "(", italic(x), ")", sep = "")))
            legend("topright", legend = c(paste("X~EXP(1/", bquote(.(round(mean(X), 
                3))), ")", sep = ""), paste("Loglik = ", bquote(.(round(Max.lik, 
                2))))), bty = "n", cex = cex.leg)
            if(density.leg == TRUE) 
            {legend("topleft", col = est.col, lty = 2, legend = "Obs. density", 
                bty = "n", cex = cex.leg)}
            segments(X, rep(0, length(X)), X, dexp(X, 1/mean(X)), 
                lty = 2, col = est.col)
        }
    }
    if (anim == TRUE) {
        nm <- which(logl == max(logl))[1]
        if (plot.likfunc == TRUE & plot.density == TRUE) 
            dev.new(height = 4, width = 8)
        par(mfrow = c(1, 2), mar = c(4.4, 4.5, 1, 0.5), cex = 0.9)
        for (i in 1:(nm - 1)) {
            dev.hold()
            if (plot.likfunc == TRUE) {
                plot(possibilities, logl, type = "n", ylab = ifelse(is.null(ylab), 
                  "Exponential Log-likelihood function", ylab), 
                  xlab = ifelse(is.null(xlab), expression(paste("Estimates for ", 
                    theta)), xlab), ...)
                arrows(possibilities[i], logl[i], possibilities[i + 
                  1], logl[i + 1], col = est.col, length = 0.15, lwd = 1)
                points(possibilities[1:i], logl[1:i], lty = 2, 
                  col = est.col, lwd = 1, type = "l")
                if (i == (nm - 1)) {
                  points(possibilities, logl, type = "l")
                  abline(v = mean(X), lty = 2, col = est.col)
                  legend("topright", legend = bquote(paste("ML est. = ", 
                    .(MLE))), cex = cex.leg, bty = "n")
                }
            }
            if (plot.density == TRUE) {
                x <- NULL
                rm(x)
                curve(dexp(x, 1/possibilities[i]), from = min(X), 
                  to = max(X), xlab = expression(italic(x)), 
                  ylab = expression(paste(italic(f), "(", italic(x), 
                    ")", sep = "")))
                segments(x0 = X, y0 = rep(0, length(X)), x1 = X, 
                  y1 = dexp(X, 1/possibilities[i]), col = est.col, 
                  lty = 2)
                if (i != (nm - 1)) {
                  legend("topright", legend = c(as.expression(bquote(paste(theta, 
                    " = ", .(round(possibilities[i], 2))))), 
                    as.expression(bquote(paste("Loglik = ", .(round(logl[i], 
                      2)))))), bty = "n", cex = cex.leg)
                }
                if (i == (nm - 1)) {
                  legend("topright", legend = c(as.expression(bquote(paste(theta, 
                    " = ", .(MLE)))), as.expression(bquote(paste("Loglik = ", 
                    .(round(Max.lik, 2)))))), bty = "n", cex = cex.leg)
                }
            }
            dev.flush()
            Sys.sleep(interval)
        }
        if (plot.calc == TRUE) {
            dev.new(width = 4, height = 4, ypos = 225)
            par(mar = c(4.4, 4.5, 1, 0.5), cex = 0.9)
            X <- sort(X)
            c <- ifelse(length(X) < 200, round(200/length(X), 
                0), 1)
            x0 = rep(X, each = c)
            y0 = rep(rep(0, length(X)), each = c)
            y1 = rep(dexp(X, 1/mean(X)), each = c)
            loglik <- log(dexp(X, 1/mean(X)))
            cumlik <- rep(cumsum(loglik), each = c)
            for (i in 1:(length(X) * c)) {
                dev.hold()
                x <- NULL
                rm(x)
                curve(dexp(x, 1/mean(X)), from = min(X), to = max(X), 
                  xlab = "x", ylab = "f(x)")
                if(density.leg == TRUE){
                legend("topleft", col = 2, lty = 2, legend = "Obs. density", 
                  bty = "n", cex = cex.leg)}
                legend("topright", legend = c(paste("X~EXP(1/", 
                  bquote(.(round(mean(X), 4))), ")"), paste("Loglik = ", 
                  bquote(.(round(cumlik[i], 2))))), bty = "n", 
                  cex = cex.leg)
                segments(x0[1:i], y0[1:i], x0[1:i], y1[1:i], 
                  col = est.col, lty = 2)
                dev.flush()
                Sys.sleep(interval)
            }
        }
    }
}
