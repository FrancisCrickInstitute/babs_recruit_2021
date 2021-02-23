# Background

We would like you to prepare a presentation, no longer than twenty
minutes, on approaches to the following problems. They are all
questions that we have been asked by Crick scientists. We have given a
selection so that you can chose which best allows you to express your
talents in the time allowed, as we generally assign projects based on
the closest match in skills. We would strongly recommend focussing
your presentation on Q1, but encourage you to at least think about the
other two as we might investigate them in the rest of the interview.

If you have any difficulties or concerns, please let me know at
gavin.kelly@crick.ac.uk. We will post the responses to any questions
here, so it may be worth checking it again.

We don't expect a large body of code or slides: we'd much rather that
you consider the issues around your chosen question(s).

# Q1) Experimental Design 
A scientist comes to us wanting to run an experiment on a set of
cell-lines (samples historically derived from individuals.)  Three
represent individuals who responded to therapy; four are from
individuals who didn't. These are the only cell-lines available that
are relevant to the question.

For each of these seven samples we propose assessing the expression of
a number of genes (via an RNASeq assay) both on the untreated sample
and also on the sample that has been treated in some way. The purpose
being to assess, for each gene in turn, if the changes of expression
due to treatment across the individuals labelled as responders, are
different to those in the non-responder group.

What statistical model makes best use of these (3+4)×2
samples, or should the design be changed? What other comparisons might
the scientist ask of this data, and what contrasts would you propose
to answer them. 

There is an [R script here](q1.r) that sets up some data corresponding
to this question, or you can work with the [raw data
object](DESeqDataSet.rds)


# Q2) Improving a Simplistic Analysis
Patients' susceptibility to 'flu is assessed by repeatedly diluting
serum down until a binary detection of the ability to respond to an
infection is no longer positive.  This is done both before and after
a patient has been treated with a candidate vaccine. The possible
dilution ratios start at 1:10 and are then halved 1:20 all the way to
1:1280. So if a sample passes at 1:10 and 1:20 and then fails it is
recorded as "20" etc; a fail at 1:10 is recorded as "0", and if it never
fails it is recorded as "1280".

The [R script](q2.r) below, and in the repository, recreates one
current methodolgy for summarising susceptibility per cohort.

``` R
library(tidyverse)
raw_data <- read.csv("flu.csv")
long_data <- tidyr::gather(raw_data, key="PrePost", value="titer", Before, After)
grouped_data  <- long_data %>%
  mutate(measure=ifelse(titer<10, 5, titer)) %>%
  group_by(strain, Age, Egg.Cell, PrePost) %>%
  summarise(GMT=exp(mean(log(measure))))
```
What improvements would you make to this approach.

# Q3) Interpreting a vague question

Sometimes we need to help scientists re-phrase their question before they
are anwerable. Imagine the following question was emailed to you:
please draft a response email that will begin a dialogue. 

> There are ~200 genes coding for F-actin-binding proteins (FABP) ,
> which may be amongst ~5000 somatic mutations which are often seen in
> tumours which develop upon treatment by MCA. In essence, we are
> interested to know how many samples would be needed to
> statistically find a mutation in FABP.
