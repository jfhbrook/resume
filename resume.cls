% Copyright 2020 Josh Holbrook
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%
% Some parts of the API are influenced by a previously used resume class
% originall found at http://people.debian.org/~dburrows/resume-cls.html and
% copyright 2005 Daniel Burrows.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\LoadClassWithOptions{extarticle}

\RequirePackage[inline]{enumitem}
\RequirePackage{booktabs}
\RequirePackage{collect}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{geometry}

\pagestyle{empty}
\setlength{\parindent}{0em}

\newcommand{\@fromdate}[1]{{#1}}
\newcommand{\@todate}[1]{{#1}}
\newcommand{\dates}[2][]{\renewcommand{\@fromdate}[1]{{#1}}\renewcommand{\@todate}[1]{{#2}}}

\renewcommand{\@author}{}
\newcommand{\@location}{}
\newcommand{\@phone}{}
\newcommand{\@email}{}
\newcommand{\@webpage}{}

\renewcommand{\author}[1]{\renewcommand{\@author}{#1}}
\newcommand{\location}[1]{\renewcommand{\@location}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\webpage}[1]{\renewcommand{\@webpage}{#1}}

\renewcommand{\maketitle}{
  \Huge \@author \normalsize \smallskip \\
  \@location{ - }\@phone{ - }\@email{ - }\@webpage
}

\renewcommand{\section}[1]{
  \huge
  {#1}
  \normalsize
}

\newlist{@skillslist}{description*}{32}
\setlist[@skillslist]{itemjoin={{,}}}

\newenvironment{skillset}[1]{
  \textbf{{{#1}}}: \begin{@skillslist}
}{
  \end{@skillslist} \linebreak
}

\newcommand{\@jobemployer}{}
\newcommand{\@joboffices}{}
\newcommand{\@jobtitle}{}
\newcommand{\@jobteam}{}
\newcommand{\@jobdates}{}

\newcommand{\employer}[1]{\renewcommand{\@jobemployer}{#1}}
\newcommand{\jobtitle}[1]{\renewcommand{\@jobtitle}{#1}}
\newcommand{\offices}[1]{\renewcommand{\@joboffices}{#1}}
\newcommand{\team}[1]{\renewcommand{\@jobteam}{#1}}

\definecollection{job}

\newenvironment{accomplishments}{
  \@nameuse{collect}{job}{\begin{itemize}}{\end{itemize}}{}{}
}{
  \@nameuse{endcollect}
}

\newenvironment{job}[1]{

}{
  \@jobemployer -
  \@joboffices -
  \@jobtitle -
  \@jobteam -
  \@fromdate -
  \@todate

  \includecollection{job}

  \renewcommand{\@jobemployer}{}
  \renewcommand{\@joboffices}{}
  \renewcommand{\@jobtitle}{}
  \renewcommand{\@jobteam}{}
  \renewcommand{\@fromdate}{}
  \renewcommand{\@todate}{}
}
