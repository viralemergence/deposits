#' Check if deposit is submitted
#' 
#' Checks to see if a deposit is using zenodo and has been submitted according to its hostdata
#' 
#' See \url{https://developers.zenodo.org/#representation} for more details about the submitted field.
#' 
#' 
#' @param self environment created within depositsClient
#' @return logical. TRUE if the deposit has been published to zenodo


check_service_submitted <- function(self){

       if (self$service == "zenodo"){
            out  <- self$hostdata$submitted 
              
          return(out)
       }

       return(FALSE)
}

#' Correct download urls for submitted deposits
#' 
#' Removes "draft/" from the URL of deposits that have been published on zenodo.
#' @param self environment created within the depositsClient
#' @return returns self$hostdata.

correct_download_urls <- function(self){
       # if submitted and zenodo, correct the url in downloadlinks
       if(check_service_submitted(self)){
              self$hostdata$files$links$download <- gsub("draft/","",self$hostdata$files$links$download)
       }
             return(self$hostdata)
}