# About Heuristics 2018

Repository accompanying the 2018 Heuristics course at Faculty of Nuclear Sciences and Physical Engineering, Czech Technical University in Prague.

## Structure of the repository

* `assignments/` folder (**new**) contains student's works
* `classes/` folder contains files with all the materials related to the classes, mostly Jupyter notebooks, organized as `YYYYMMDD-*.{ipynb,py}` where `YYYYMMDD` is date of the class and:
   * IPYNB file contains an Jupyter (IPython) notebook - it can be rendered directly on GitHub or opened locally in Jupyter,
   * PY contains plain text Python source code version of the notebook - only because it can be easily reviewed or referenced in e.g. a [pull request](https://help.github.com/articles/about-pull-requests/).
* `src/` folder contains all source codes which can be imported and re-used.

## Organizational notes for students

**IMPORTANT**: Please refer to `classes/20180220_Introduction.{ipynb,py}` for the most important information on _zápočet_.

### Recommended topics for own work

#### 1. Tuning of implemented heuristics on implemented objective functions

It is absolutely OK to re-use any materials from the classes, including source codes. But beware: simple re-running of existing heuristics and obj. functions, even on larger parameter space, is **not enough**.  Large scale experiments should be accompanied by reasonable analysis of the results and thoughtful conclusions.

#### 2. Implementation and tuning of new heuristics and/or new objective functions

Reasonable study of heuristic/obj. function parameters, including comparison with selected referential methods, will be required as output.

#### 3. Improvement of existing code base

By implementing unit tests, better handling of edge cases, improving documentation, packaging etc. Any work in this regard should be discussed in advance.

### How to submit own work

As a Jupyter notebook (including the .PY version), ideally. Regular PDF is OK as well. Just name the files reasonably (`HEURISTIKY.pdf` is a bad name) and any form readable on a mobile device will be appreciated.

Furthermore, consider the following technical ways of submission:

1. [Pull request](https://help.github.com/articles/about-pull-requests/) is definitely the favored alternative
2. Via e-mail

Last, but not least, English language is preferred.


**All rights reserved. For more information please contact me @ [mojzemat@fjfi.cvut.cz](mailto:mojzemat@fjfi.cvut.cz)**.
