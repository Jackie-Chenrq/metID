% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/singlePeakIdentification.R
\name{identify_single_peak}
\alias{identify_single_peak}
\title{Identify single peak based on database.}
\usage{
identify_single_peak(
  ms1.mz,
  ms1.rt,
  ms2,
  ms1.match.ppm = 25,
  ms2.match.ppm = 30,
  mz.ppm.thr = 400,
  ms2.match.tol = 0.5,
  fraction.weight = 0.3,
  dp.forward.weight = 0.6,
  dp.reverse.weight = 0.1,
  rt.match.tol = 30,
  polarity = c("positive", "negative"),
  ce = "all",
  column = c("hilic", "rp"),
  ms1.match.weight = 0.25,
  rt.match.weight = 0.25,
  ms2.match.weight = 0.5,
  path = ".",
  total.score.tol = 0.5,
  candidate.num = 3,
  database,
  threads = 3
)
}
\arguments{
\item{ms1.mz}{m/z value of the peaks}

\item{ms1.rt}{rt value of the peaks}

\item{ms2}{MS2 spectra of the peaks. It must be a two column data frame, the
first column is m/z and the second column is the intensity.}

\item{ms1.match.ppm}{Precursor match ppm tolerance.}

\item{ms2.match.ppm}{Fragment ion match ppm tolerance.}

\item{mz.ppm.thr}{Accurate mass tolerance for m/z error calculation.}

\item{ms2.match.tol}{MS2 match (MS2 similarity) tolerance.}

\item{fraction.weight}{The weight for matched fragments.}

\item{dp.forward.weight}{Forward dot product weight.}

\item{dp.reverse.weight}{Reverse dot product weight.}

\item{rt.match.tol}{RT match tolerance.}

\item{polarity}{The polarity of data, "positive"or "negative".}

\item{ce}{Collision energy. Please confirm the CE values in your database. Default is "all".}

\item{column}{"hilic" (HILIC column) or "rp" (reverse phase).}

\item{ms1.match.weight}{The weight of MS1 match for total score calculation.}

\item{rt.match.weight}{The weight of RT match for total score calculation.}

\item{ms2.match.weight}{The weight of MS2 match for total score calculation.}

\item{path}{Work directory.}

\item{total.score.tol}{Total score tolerance. The total score are refering to MS-DIAL.}

\item{candidate.num}{The number of candidate.}

\item{database}{MS2 database name.}

\item{threads}{Number of threads}
}
\value{
A metIdentifyClass object.
}
\description{
We can use this function to identify single peak, you can just provide m/z or rt, or you can also provide MS2 spectrum for this peak.
\lifecycle{experimental}
}
\examples{
\dontrun{
mz <- 472.3032
rt <- 772.906
ms2 <- data.frame(
mz = c(81.38455,82.19755,85.02840,86.5934,86.98958,89.48135,90.70250,
         93.03886, 102.09140, 103.03903, 116.01658, 127.98412, 
         134.06819, 152.46967, 162.02180, 162.05521, 162.11261),
  intensity = c(1396.341,1488.730,15473.604, 1740.842,2158.014,1351.686,
                1547.099,1325.864,22441.047,76217.016,17809.395,
                1439.743, 1729.786, 1543.765, 2228.743, 
                3508.225, 529120.000),
  stringsAsFactors = FALSE
)

path <- file.path(".", "example")
dir.create(path = path, showWarnings = FALSE)
database <- system.file("ms2_database", package = "metID")

file.copy(from = file.path(database, "msDatabase_rplc0.0.2"), 
         to = path, overwrite = TRUE, recursive = TRUE)

annotation_result <- 
identify_single_peak(ms1.mz = mz, 
                    ms1.rt = rt, 
                    ms2 = ms2, 
                    ms1.match.ppm = 15, 
                    rt.match.tol = 30,
                    ms2.match.tol = 0.5, 
                    database = "msDatabase_rplc0.0.2",
                    path = path)
                    
annotation_result
}
}
\author{
Xiaotao Shen
\email{shenxt1990@163.com}
}
