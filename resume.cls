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
% originally found at http://people.debian.org/~dburrows/resume-cls.html and
% copyright 2005 Daniel Burrows but no meaningful code is shared.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\LoadClassWithOptions{extarticle}

\RequirePackage{amssymb}
\RequirePackage{collect}
\RequirePackage[inline]{enumitem}
\RequirePackage{fontspec}
\RequirePackage[tmargin=0.75in,bmargin=0.75in,lmargin=0.875in,rmargin=0.875in]{geometry}
\RequirePackage{hyperref}
\RequirePackage{ifthen}

% \RequirePackage{booktabs}
% \RequirePackage{calc}

\pagestyle{empty}
\setlength{\parindent}{0em}
\setmainfont[Ligatures=TeX]{Merriweather}
\setsansfont[Ligatures=TeX]{Montserrat}
\setmonofont[Ligatures=TeX]{mononoki}

\newcommand{\@extendedcv}{0}
\newcommand{\extendedcv}{
  \renewcommand{\@extendedcv}{1}
}

\newcommand{\@fromdate}[1]{{#1}}
\newcommand{\@todate}[1]{{#1}}
\newcommand{\dates}[2][]{\renewcommand{\@fromdate}{#1}\renewcommand{\@todate}{#2}}

\newcommand{\makedaterange}{\@fromdate \ifthenelse{\equal{\@fromdate}{}}{}{ - }\@todate}

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
  \Huge \textsf{\textbf{\@author}} \normalsize \\
  \small \textsf{\@location{ - }\@phone{ - }\@email{ - }\@webpage} \normalsize
}

\renewcommand{\section}[1]{
  \goodbreak
  \vspace{1em}
  \Large
  \textsf{\textbf{#1}}
  \normalsize
  \medskip
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
\definecollection{extendedjob}

\newenvironment{accomplishments}{
  \@nameuse{collect}{job}{\begin{itemize}[topsep=0pt,parsep=1pt,itemsep=0pt,leftmargin=10pt]}{\end{itemize}}
}{
  \@nameuse{endcollect}
}

\newenvironment{extendedaccomplishments}{
    \@nameuse{collect}{extendedjob}{\begin{itemize}[topsep=0pt,parsep=1pt,itemsep=0pt,leftmargin=10pt]}{\end{itemize}}
}{
    \@nameuse{endcollect}
}

\newenvironment{job}{}{ \goodbreak
  \large \textsf{\@jobemployer\ifthenelse{\equal{\@jobteam}{}}{}{, }\@jobteam\hfill
    \makedaterange
  } \normalsize \\
  \textsf{\@jobtitle\hfill\@joboffices}

  \smallskip
 
  \includecollection{job}
  \ifthenelse{\@extendedcv > 0}{\includecollection{extendedjob}}{}

  \smallskip

  \renewcommand{\@jobemployer}{}
  \renewcommand{\@joboffices}{}
  \renewcommand{\@jobtitle}{}
  \renewcommand{\@jobteam}{}
  \renewcommand{\@fromdate}{}
  \renewcommand{\@todate}{}
}


\newcommand{\@projectname}{}
\newcommand{\@projecturl}{}
\newcommand{\@stars}{}

\newcommand{\projectname}[1]{\renewcommand{\@projectname}{#1}}
\newcommand{\projecturl}[1]{\renewcommand{\@projecturl}{#1}}
\newcommand{\stars}[1]{\renewcommand{\@stars}{#1}}

\definecollection{project}

\newenvironment{projectdescription}{
  \@nameuse{collect}{project}{}{}
}{
  \@nameuse{endcollect}
}

\newenvironment{project}{}{
  \goodbreak
  \large
  \textsf{\ifthenelse{\equal{\@projecturl}{}}{\@projectname}{\href{\@projecturl}{\@projectname}}\ifthenelse{\equal{\@stars}{}}{}{\hspace{2pt}\(\bigstar\)\hspace{-1pt}\@stars}
    \hfill
  \makedaterange} \normalsize
  \smallskip

  \includecollection{project}

  \medskip

  \renewcommand{\@projectname}{}
  \renewcommand{\@projecturl}{}
  \renewcommand{\@fromdate}{}
  \renewcommand{\@todate}{}
}

\newlist{@skillslist}{description*}{32}
\setlist[@skillslist]{itemjoin={{,}},itemsep=1em,afterlabel=\unskip{{~}}}


\newenvironment{skillset}[1]{
  \sffamily
  \textbf{#1:}\hspace{2px} \begin{@skillslist}
}{
\end{@skillslist}\rmfamily\smallskip\\
}


\newcommand{\@institution}{}
\newcommand{\@degree}{}
\newcommand{\@major}{}
\newcommand{\@minor}{}
\newcommand{\@thesis}{}
\newcommand{\@honor}{}
\newcommand{\@gpa}{}

\newcommand{\institution}[1]{\renewcommand{\@institution}{#1}}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}
\newcommand{\major}[1]{\renewcommand{\@major}{#1}}
\newcommand{\minor}[1]{\renewcommand{\@minor}{#1}}
\newcommand{\thesis}[1]{\renewcommand{\@thesis}{#1}}
\newcommand{\honor}[1]{\renewcommand{\@honor}{#1}}
\newcommand{\gpa}[1]{\renewcommand{\@gpa}{#1}}

\newenvironment{education}{}
{
  \goodbreak
  \large
  \textsf{\@degree\ifthenelse{\equal{\@major}{}}{}{, \@major} \hfill \makedaterange}
  \normalsize \\
  \textsf{\@institution\ifthenelse{\equal{\@gpa}{}}{}{\hfill GPA: \@gpa}}
  \ifthenelse{\equal{\@minor}{}}{}{\smallskip Minor: \@minor}

  \renewcommand{\@institution}{}
  \renewcommand{\@degree}{}
  \renewcommand{\@major}{}
  \renewcommand{\@minor}{}
  \renewcommand{\@thesis}{}
  \renewcommand{\@gpa}{}
  \renewcommand{\@fromdate}{}
  \renewcommand{\@todate}{}
}


\newcommand{\@awardname}{}
\newcommand{\@awardamount}{}

\newcommand{\awardname}[1]{\renewcommand{\@awardname}{#1}}
\newcommand{\awardamount}[1]{\renewcommand{\@awardamount}{#1}}

\newenvironment{award}{}{
  \renewcommand{\@awardname}{}
  \renewcommand{\@projectname}{}
  \renewcommand{\@awardamount}{}

  \renewcommand{\@fromdate}{}
  \renewcommand{\@todate}{}
}


\newcommand{\@organization}{}

\newcommand{\organization}[1]{\renewcommand{\@organization}{#1}}

\definecollection{service}

\newenvironment{servicedescription}{
  \@nameuse{collect}{service}{}{}
}{
  \@nameuse{endcollect}
}

\newenvironment{service}{}{
  \renewcommand{\@organization}{}

  \renewcommand{\@fromdate}{}
  \renewcommand{\@todate}{}
}
