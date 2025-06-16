#' Check if deposit is submitted
#' 
#' Checks to see if a deposit is using zenodo and has been submitted according to its hostdata
#' 
#' See \url{https://developers.zenodo.org/#representation} for more details about the submitted field.
#' 
#' 
#' @param hostdata data returned from service API
#' @return logical. TRUE if the deposit has been published to zenodo


check_hostdata_submitted <- function(hostdata){

     hostdata$submitted 

}

#' Correct download urls for submitted deposits
#' 
#' Removes "draft/" from the URL of deposits that have been published on zenodo.
#' @param hostdata data returned from service API
#' @return returns self$hostdata.

correct_download_urls <- function(hostdata){
       # if submitted and zenodo, correct the url in downloadlinks
       if(check_hostdata_submitted(hostdata)){
              hostdata$files$links$download <- gsub("draft/","",hostdata$files$links$download)
       }
             return(hostdata)
}