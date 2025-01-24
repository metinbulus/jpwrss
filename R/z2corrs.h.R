
# This file is automatically generated, you probably don't want to edit this

z2corrsOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "z2corrsOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            calculate = "selectpower", ...) {

            super$initialize(
                package="jpwrss",
                name="z2corrs",
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

z2corrsResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "z2corrsResults",
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
                title="Difference between Two Correlations (Independent Samples z Test)",
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

z2corrsBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "z2corrsBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "jpwrss",
                name = "z2corrs",
                version = c(1,0,0),
                options = options,
                results = z2corrsResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE)
        }))

#' Difference between Two Correlations (Independent Samples z Test)
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
z2corrs <- function(
    calculate = "selectpower") {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("z2corrs requires jmvcore to be installed (restart may be required)")


    options <- z2corrsOptions$new(
        calculate = calculate)

    analysis <- z2corrsClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}

