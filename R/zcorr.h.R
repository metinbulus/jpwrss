
# This file is automatically generated, you probably don't want to edit this

zcorrOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "zcorrOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            calculate = "selectpower", ...) {

            super$initialize(
                package="jpwrss",
                name="zcorr",
                requiresData=FALSE,
                ...)

            private$..calculate <- jmvcore::OptionList$new(
                "calculate",
                calculate,
                options=list(
                    "selectpower",
                    "selectsamplesize"),
                default="selectpower")

            self$.addOption(private$..calculate)
        }),
    active = list(
        calculate = function() private$..calculate$value),
    private = list(
        ..calculate = NA)
)

zcorrResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "zcorrResults",
    inherit = jmvcore::Group,
    active = list(
        text2 = function() private$.items[["text2"]],
        plot = function() private$.items[["plot"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="One Correlation against a Constant (One Sample z Test)",
                refs=list(
                    "pwrss"))
            self$add(jmvcore::Preformatted$new(
                options=options,
                name="text2",
                title="One Proportion z test"))
            self$add(jmvcore::Image$new(
                options=options,
                name="plot",
                title="A proportion against a Constant (z Test)",
                renderFun=".plot"))}))

zcorrBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "zcorrBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "jpwrss",
                name = "zcorr",
                version = c(1,0,0),
                options = options,
                results = zcorrResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE)
        }))

#' One Correlation against a Constant (One Sample z Test)
#'
#' 
#' @param calculate .
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$text2} \tab \tab \tab \tab \tab a preformatted \cr
#'   \code{results$plot} \tab \tab \tab \tab \tab an image \cr
#' }
#'
#' @export
zcorr <- function(
    calculate = "selectpower") {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("zcorr requires jmvcore to be installed (restart may be required)")


    options <- zcorrOptions$new(
        calculate = calculate)

    analysis <- zcorrClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}

