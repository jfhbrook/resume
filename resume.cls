% resume.cls
%
%    Copyright 2005 Daniel Burrows
%
% You may use, modify, and redistribute this file in any way you please, so
% long as this copyright notice is maintained.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}

\LoadClassWithOptions{article}

% No page numbers by default.
\pagestyle{empty}

\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{url}
\RequirePackage{tabularx}
\RequirePackage{pgf}
\RequirePackage{pgfshade}
\RequirePackage{xxcolor}

%\RequirePackage{times}
%\RequirePackage[T1]{fontenc}

\RequirePackage[tmargin=1in,bmargin=1in]{geometry}

\definecolor{rulestartcolor}{rgb}{0,0,0}
\definecolor{ruleendcolor}{rgb}{0.4,0.4,0.4}

\newlength{\headerbuffer}
\setlength{\headerbuffer}{3pt}
\newlength{\secskip}
\setlength{\secskip}{10pt}

\newlength{\@headerscratch}

% Usage: \@setupshading{width}{height}{start}{end}
\newcommand{\@setupshading}[4]{%
  \pgfdeclarehorizontalshading{@ruleshading}{#2}{%
    color(0pt)=(#3); color(#1)=(#4)%
  }
}

\newcommand{\pgfrule}[4]{%
  \begin{pgfpicture}{0pt}{0pt}{#1}{#2}%
    \pgfdeclarehorizontalshading{@ruleshading}{#2}{%
      color(0pt)=(#3); color(#1)=(#4)%
    }
    \pgfputat{\pgfxy(0,0)}{\pgfbox[left,bottom]{\pgfuseshading{@ruleshading}}}
  \end{pgfpicture}%
}

\newcommand{\lrule}[2]{\pgfrule{#1}{#2}{rulestartcolor}{ruleendcolor}}
\newcommand{\rrule}[2]{\pgfrule{#1}{#2}{ruleendcolor}{rulestartcolor}}

\newcommand{\@authorname}{}
\newcommand{\@email}{}
\newcommand{\@streetaddress}{}
\newcommand{\@citystatezip}{}
\newcommand{\@phone}{}
\newcommand{\@webpage}{}

\renewcommand{\author}[1]{\renewcommand{\@authorname}{#1}}
\newcommand{\email}[1]{\renewcommand{\@email}{#1}}
\newcommand{\streetaddress}[1]{\renewcommand{\@streetaddress}{#1}}
\newcommand{\citystatezip}[1]{\renewcommand{\@citystatezip}{#1}}
\newcommand{\phone}[1]{\renewcommand{\@phone}{#1}}
\newcommand{\webpage}[1]{\renewcommand{\@webpage}{#1}}

%MAKETITLE
\renewcommand{\maketitle}{
\textbf{\Huge \@authorname }\hrule
\smallskip\small \@streetaddress{  }\@citystatezip{ -- } \@phone{ -- }\@email{ -- }\@webpage \normalsize

}

%section
\renewcommand{\section}[1]{%
  \goodbreak\vspace{\secskip}%
  \par\nointerlineskip\noindent
  \Large{\textbf{\underline{\textit{#1}}}}
  \vspace{\headerbuffer}
  \par\nointerlineskip\noindent%
  %\lrule{\linewidth}{0.4pt}%
  \vspace{\headerbuffer}
  \par\nointerlineskip}

%subsection
\renewcommand{\subsection}[1]{%
  \goodbreak\vspace{\secskip}\par\nointerlineskip\vspace{-1em}\textbf{\flushleft{#1}:}\par%
}

% General catch-all for either educational or job affiliation.
%
%  Usage:
% \affiliation[title]{institution}{years}
\newcommand{\affiliation}[3][]{%
  \goodbreak\vspace{\secskip}\par\noindent\begin{tabularx}{\linewidth}{Xr}%
    {\bfseries #2} & \textit{#3}%
    \ifthenelse{\equal{#1}{}}{}{%
      \\ \textbf{#1}%
    }%
  \end{tabularx}%
}%
%
