getEnvOf <- function(what, which=rev(sys.parents())) {
        for (frame in which)
                if (exists(what, frame=frame, inherits=FALSE)) 
                        return(sys.frame(frame))
        return(NULL)
}