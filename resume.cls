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

\RequirePackage{collect}
\RequirePackage[inline]{enumitem}
\RequirePackage{fontspec}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{ifthen}

% \RequirePackage{booktabs}
% \RequirePackage{calc}

\pagestyle{empty}
\setlength{\parindent}{0em}
\setmainfont[Ligatures=TeX]{Merriweather}
\setsansfont[Ligatures=TeX]{Montserrat}
\setmonofont[Ligatures=TeX]{mononoki}

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
\newcommand{\email}[1]{\renewcommand{\@email}{\href{mailto:#1}{#1}}}
\newcommand{\webpage}[1]{\renewcommand{\@webpage}{\href{#1}{#1}}}

\renewcommand{\maketitle}{
  \Huge \textsf{\textbf{\@author}} \normalsize \smallskip \hrule
  \small \textsf{\textbf{\@location{ - }\@phone{ - }\@email{ - }\@webpage}} \normalsize
}


\renewcommand{\section}[1]{
  \goodbreak
  \vspace{1em}
  \Large
  \textsf{\textbf{#1}}
  \normalsize
  \hfill \\
}


\newlist{@skillslist}{description*}{32}
\setlist[@skillslist]{itemjoin={{,}}}

\newenvironment{skillset}[1]{
  \textbf{{{#1}}} \\
  \begin{@skillslist}
}{
  \end{@skillslist} \\
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
  \@nameuse{collect}{job}{\begin{itemize}}{\end{itemize}}
}{
  \@nameuse{endcollect}
}

\newenvironment{job}[1]{}{
  \textbf{\@jobemployer} -
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


\newcommand{\@projectname}{}

\newcommand{\projectname}[1]{\renewcommand{\@projectname}{#1}}

\definecollection{project}

\newenvironment{projectdescription}{
  \@nameuse{collect}{project}{}{}
}{
  \@nameuse{endcollect}
}

\newenvironment{project}{}{
  \textbf{\@projectname} -
  \@fromdate - \@todate

  \includecollection{project}

  \renewcommand{\@projectname}{}
}

\newcommand{\@institution}{}
\newcommand{\@degree}{}
\newcommand{\@major}{}
\newcommand{\@minor}{}
\newcommand{\@thesis}{}
\newcommand{\@gpa}{}

\newcommand{\institution}[1]{\renewcommand{\@institution}{#1}}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\major}[1]{\renewcommand{\@major}{#1}}
\newcommand{\minor}[1]{\renewcommand{\@minor}{#1}}
\newcommand{\thesis}[1]{\renewcommand{\@thesis}{#1}}
\newcommand{\gpa}[1]{\renewcommand{\@gpa}{#1}}

\newenvironment{education}{}
{
  \@institution - \@fromdate - \@todate - \@degree in \@major (gpa \@gpa)
}
