% Copyright (c) 2024 by Valdigleis 
% https://gitlab.com/valdigleis/vTeX/Beamer
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You can find the GNU General Public License at <http://www.gnu.org/licenses/>.

% -------------------------------------------------------------------------------------------------
% Basic infos e definitions
% -------------------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vLetter}[2024/02/09 v1.0 vLetter a TeX Class for CV and letter document]


% -------------------------------------------------------------------------------------------------
% Paper size options
% -------------------------------------------------------------------------------------------------
\DeclareOption{a4paper}{
  \setlength\paperheight{297mm}
  \setlength\paperwidth{210mm}
}

\DeclareOption{a5paper}{
  \setlength\paperheight{210mm}
  \setlength\paperwidth{148mm}
}

\DeclareOption{b5paper}{
  \setlength\paperheight{250mm}
  \setlength\paperwidth{176mm}
}

\DeclareOption{letterpaper}{
  \setlength\paperheight{11in}
  \setlength\paperwidth{8.5in}
}

\DeclareOption{legalpaper}{
  \setlength\paperheight{14in}
  \setlength\paperwidth{8.5in}
}

\DeclareOption{executivepaper}{
  \setlength\paperheight{10.5in}
  \setlength\paperwidth{7.25in}
}

\DeclareOption{landscape}{
  \setlength\@tempdima{\paperheight}
  \setlength\paperheight{\paperwidth}
  \setlength\paperwidth{\@tempdima}
}

% -------------------------------------------------------------------------------------------------
% Font size options
% -------------------------------------------------------------------------------------------------
\newcommand\@ptsize{}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}

% -------------------------------------------------------------------------------------------------
% font type options
% -------------------------------------------------------------------------------------------------
\DeclareOption{sans}{\AtBeginDocument{\renewcommand{\familydefault}{\sfdefault}}}
\DeclareOption{roman}{\AtBeginDocument{\renewcommand{\familydefault}{\rmdefault}}}

% -------------------------------------------------------------------------------------------------
% draft/final option
% -------------------------------------------------------------------------------------------------
\DeclareOption{draft}{\setlength\overfullrule{7pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}

% -------------------------------------------------------------------------------------------------
% The default options
% -------------------------------------------------------------------------------------------------
\ExecuteOptions{a4paper,11pt,final}

% -------------------------------------------------------------------------------------------------
% Get and Process given options
% -------------------------------------------------------------------------------------------------
\ProcessOptions\relax
\input{size1\@ptsize.clo}

% -------------------------------------------------------------------------------------------------
% Basic packages and configurations
% -------------------------------------------------------------------------------------------------
\RequirePackage{etoolbox}

\RequirePackage{ifthen}

\RequirePackage{xcolor}

\RequirePackage[T1]{fontenc}

\IfFileExists{lmodern.sty}{\RequirePackage{lmodern}}{}

\newcommand*\pdfpagemode{UseNone}%
\RequirePackage{url}
\urlstyle{tt}
\AtEndPreamble{%
  \pagenumbering{arabic}%
  \RequirePackage[unicode]{hyperref}%
  \hypersetup{
    breaklinks,
    baseurl       = https://,
    pdfborder     = 0 0 0,
    pdfpagemode   = \pdfpagemode,
    pdfstartpage  = 1,
    pdfcreator    = {\LaTeX{} with 'moderncv' package},
    bookmarksopen = true,
    bookmarksdepth= 2,
    pdfauthor     = {\@firstname{}~\@lastname{}},
    pdftitle      = {\@firstname{}~\@lastname{} -- \@title{}},
    pdfsubject    = {Resum\'{e} of \@firstname{}~\@lastname{}},
    pdfkeywords   = {\@firstname{}~\@lastname{}, curriculum vit\ae{}, resum\'{e}}
  }
}


\RequirePackage{graphicx}

\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
  \fancyhf{}
}

\newif\if@displaypagenumbers\@displaypagenumberstrue
\newcommand*{\nopagenumbers}{\@displaypagenumbersfalse}

\AtEndPreamble{%
  \AtBeginDocument{%
    \if@displaypagenumbers%
      \@ifundefined{r@lastpage}{}{%
        \ifthenelse{\pageref{lastpage}>1}{%
          \newlength{\pagenumberwidth}%
          \settowidth{\pagenumberwidth}{\color{color2}\addressfont\itshape\strut\thepage/\pageref{lastpage}}%
          \fancypagestyle{plain}{%
            \fancyfoot[r]{\parbox[b]{\pagenumberwidth}{\color{color2}\pagenumberfont\strut\thepage/\pageref{lastpage}}}}
          \pagestyle{plain}}{}}%
  \AtEndDocument{\label{lastpage}}\else\fi}
}

\pagestyle{plain}

\RequirePackage{tweaklist}
\renewcommand*{\itemhook}{%
    \@minipagetrue%
    \@noparlisttrue%
    \setlength{\topsep}{0pt}%
    \setlength{\partopsep}{0pt}%
    \setlength{\parsep}{0pt}%
    \setlength{\parskip}{0pt}%
    \setlength{\itemsep}{0pt}
}
\renewcommand*{\enumhook}{\itemhook{}}
\renewcommand*{\deschook}{\itemhook{}}

\RequirePackage{calc}

\RequirePackage{xparse}

\RequirePackage{microtype}

% -------------------------------------------------------------------------------------------------
% Minimal configs
% -------------------------------------------------------------------------------------------------
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength{\parindent}{0\p@}
\setlength{\parskip}{0\p@}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}

\raggedbottom
\onecolumn

% -------------------------------------------------------------------------------------------------
% Colors
% -------------------------------------------------------------------------------------------------
\definecolor{color0}{rgb}{0,0,0}% main default color, normally left to black
\definecolor{color1}{rgb}{0,0,0}% primary theme color
\definecolor{color2}{rgb}{0,0,0}% secondary theme color
\definecolor{color3}{rgb}{0,0,0}% tertiary theme color

% -------------------------------------------------------------------------------------------------
% Commands and structures
% -------------------------------------------------------------------------------------------------
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}

\renewcommand*{\title}[1]{\def\@title{#1}}

\NewDocumentCommand{\address}{mG{}G{}}{\def\@addressstreet{#1}\def\@addresscity{#2}\def\@addresscountry{#3}}

\RequirePackage{collection}

\collectionnew{phones}

\newcommand*{\phone}[2][fixed]{\collectionadd[#1]{phones}{#2}}

\newcommand*{\email}[1]{\def\@email{#1}}

\newcommand*{\homepage}[1]{\def\@homepage{#1}}

\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}


% -------------------------------------------------------------------------------------------------
% Symbols in lists
% -------------------------------------------------------------------------------------------------
\newcommand*{\labelitemi}{\strut\textcolor{color1}{\large\rmfamily\textbullet}}

\newcommand*{\labelitemii}{\strut\textcolor{color1}{\large\bfseries-}}

\newcommand*{\labelitemiii}{\strut\textcolor{color1}{\rmfamily\textperiodcentered}}

\newcommand*{\labelitemiv}{\labelitemiii}

\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}


% -------------------------------------------------------------------------------------------------
% Other symbols
% -------------------------------------------------------------------------------------------------
\newcommand*{\listitemsymbol}{\labelitemi~}
\newcommand*{\addresssymbol}{}
\newcommand*{\mobilephonesymbol}{}
\newcommand*{\fixedphonesymbol}{}
\newcommand*{\faxphonesymbol}{}
\newcommand*{\emailsymbol}{}
\newcommand*{\homepagesymbol}{}

% -------------------------------------------------------------------------------------------------
% Stylezing font
% -------------------------------------------------------------------------------------------------
\AtBeginDocument{\normalfont\color{color0}}

% -------------------------------------------------------------------------------------------------
% Strings for internationalisation
% -------------------------------------------------------------------------------------------------
\newcommand*{\refname}{Publications}
\newcommand*{\enclname}{Enclosure}

% -------------------------------------------------------------------------------------------------
% Command for footer
% -------------------------------------------------------------------------------------------------
\newcommand*{\makefooter}{}


% -------------------------------------------------------------------------------------------------
% Import styles, color theme and icons theme
% -------------------------------------------------------------------------------------------------
\newcommand*{\vLetterStyle}[1]{
  \RequirePackage{styles/#1}
}

\newcommand*{\vLetterColor}[1]{
  \RequirePackage{colors/#1}
}

\newcommand*{\vLetterIcons}[1]{
  \RequirePackage{icons/#1}
}

% -------------------------------------------------------------------------------------------------
% Comands for recomputues all automatic lengths
% -------------------------------------------------------------------------------------------------
\newcommand*{\recomputelengths}{\recomputecvlengths}
\AtBeginDocument{\recomputelengths{}}

\newcommand*{\@initializelength}[1]{%
  \ifdefined#1\else\newlength{#1}\fi%
}

% -------------------------------------------------------------------------------------------------
% Design commands definitions
% -------------------------------------------------------------------------------------------------
\NewDocumentCommand{\photo}{O{64pt}O{0.4pt}m}{\def\@photowidth{#1}\def\@photoframewidth{#2}\def\@photo{#3}}
\newcommand*{\quote}[1]{\def\@quote{#1}}

\newcommand*{\namefont}{}
\newcommand*{\titlefont}{}
\newcommand*{\addressfont}{}
\newcommand*{\quotefont}{}
\newcommand*{\sectionfont}{}
\newcommand*{\subsectionfont}{}
\newcommand*{\hintfont}{}
\newcommand*{\pagenumberfont}{\addressfont\itshape}

\newcommand*{\namestyle}[1]{{\namefont#1}}
\newcommand*{\titlestyle}[1]{{\titlefont#1}}
\newcommand*{\addressstyle}[1]{{\addressfont#1}}
\newcommand*{\quotestyle}[1]{{\quotefont#1}}
\newcommand*{\sectionstyle}[1]{{\sectionfont#1}}
\newcommand*{\subsectionstyle}[1]{{\subsectionfont#1}}
\newcommand*{\hintstyle}[1]{{\hintfont#1}}
\newcommand*{\pagenumberstyle}[1]{{\pagenumberfont#1}}

\newcommand*{\recomputecvlengths}{}

\newif\if@firstdetailselement\@firstdetailselementtrue
\newcommand*{\makenewline}{
  \if@firstdetailselement%
    \strut% 
  \else%
    \\%
  \fi%
  \@firstdetailselementfalse
}

\newcommand*{\makecvtitle}{}
\newcommand*{\makecvfooter}{\makefooter}
\NewDocumentCommand{\section}{sm}{}
\NewDocumentCommand{\subsection}{sm}{}
\newcommand*{\cvitem}[3][.25em]{}
\newcommand*{\cvdoubleitem}[5][.25em]{}
\newcommand*{\cvlistitem}[2][\listitemsymbol]{}
\newcommand*{\cvlistdoubleitem}[3][\listitemsymbol]{}
\newcommand*{\cventry}[7][.25em]{}
\newcommand*{\cvitemwithcomment}[4][.25em]{}

% -------------------------------------------------------------------------------------------------
% Hyperlink commands
% -------------------------------------------------------------------------------------------------
\newcommand*{\link}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{#2}{#2}}%
    {\href{#2}{#1}}}

\newcommand*{\httplink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{https://#2}{#2}}%
    {\href{https://#2}{#1}}}

\newcommand*{\emaillink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\href{mailto:#2}{#2}}%
    {\href{mailto:#2}{#1}}}

% -------------------------------------------------------------------------------------------------
% new counters
% -------------------------------------------------------------------------------------------------
\newcounter{cvcolumnscounter}
\newcounter{cvcolumnsautowidthcounter}
\newcounter{tmpiteratorcounter}

% -------------------------------------------------------------------------------------------------
% Columns metrics
% -------------------------------------------------------------------------------------------------
\newlength{\cvcolumnsdummywidth}\setlength{\cvcolumnsdummywidth}{1000pt}
\newlength{\cvcolumnswidth}
\newlength{\cvcolumnsautowidth}
\newlength{\cvcolumnautowidth}
\newif\if@cvcolumns@head@empty%
\newenvironment*{cvcolumns}{%
  \setcounter{cvcolumnscounter}{0}%
  \setcounter{cvcolumnsautowidthcounter}{0}%
  \setlength{\cvcolumnsautowidth}{\cvcolumnsdummywidth}%
  \setlength{\cvcolumnautowidth}{0pt}%
  \@cvcolumns@head@emptytrue}%
{%
  \ifnum\thecvcolumnscounter>0%
    \setlength{\cvcolumnswidth}{\maincolumnwidth-\value{cvcolumnscounter}\separatorcolumnwidth+\separatorcolumnwidth}%
    \setlength{\cvcolumnautowidth}{\cvcolumnswidth*\ratio{\cvcolumnsautowidth}{\cvcolumnsdummywidth}/\value{cvcolumnsautowidthcounter}}%
  \fi%
  \def\cvcolumns@def{}%
  \def\cvcolumns@head{}%
  \def\cvcolumns@content{}%
  \setcounter{tmpiteratorcounter}{0}%
  \loop\ifnum\thetmpiteratorcounter<\thecvcolumnscounter%
    \ifnum\thetmpiteratorcounter=0\else%
      \g@addto@macro\cvcolumns@def{@{\hspace*{\separatorcolumnwidth}}}%
      \g@addto@macro\cvcolumns@head{&}%
      \g@addto@macro\cvcolumns@content{&}\fi%\
    \expandafter\g@addto@macro\expandafter\cvcolumns@def\expandafter{\csname cvcolumn\roman{tmpiteratorcounter}@def\endcsname}%
      \expandafter\g@addto@macro\expandafter\cvcolumns@head\expandafter{\csname cvcolumn\roman{tmpiteratorcounter}@head\endcsname}%
      \expandafter\g@addto@macro\expandafter\cvcolumns@content\expandafter{\csname cvcolumn\roman{tmpiteratorcounter}@content\endcsname}%
      \stepcounter{tmpiteratorcounter}%
  \repeat%
  \cvitem{}{%
      \begin{tabular}{\cvcolumns@def}%
        \if@cvcolumns@head@empty\else%
          \cvcolumns@head\\[-.8em]%
          {\color{color1}\rule{\maincolumnwidth}{.25pt}}\\\fi%
        \cvcolumns@content%
      \end{tabular}}%
}%

\newcommand*{\cvcolumn}[3][\cvcolumnautowidth]{%
  \ifthenelse{\equal{#1}{\cvcolumnautowidth}}{% 
    \stepcounter{cvcolumnsautowidthcounter}%
    \expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@def\endcsname{p{\cvcolumnautowidth}}%
    \expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@head\endcsname{\protect\parbox[b]{\cvcolumnautowidth}
    {\protect\subsectionstyle{#2}}}}%
  {%
    \addtolength{\cvcolumnsautowidth}{-#1\cvcolumnsdummywidth}%
    \expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@def\endcsname{p{#1\cvcolumnswidth}}%
    \expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@head\endcsname{\protect\parbox[b]{#1\cvcolumnswidth}{\protect\subsectionstyle{#2}}}
  }%
  \ifthenelse{\equal{#2}{}}{}{\@cvcolumns@head@emptyfalse}%
    \expandafter\expandafter\expandafter\def\expandafter\csname cvcolumn\roman{cvcolumnscounter}@content\endcsname{\protect\cvcolumncell{#3}}%
    \stepcounter{cvcolumnscounter}
}%

\newcommand*{\cvcolumncell}[1]{{%
  \renewcommand*{\\}{\newline}%
  \protect\vtop{#1}}%
}%

% -------------------------------------------------------------------------------------------------
% Setup bibliography environment
% -------------------------------------------------------------------------------------------------
\newlength{\bibindent}
\setlength{\bibindent}{1.5em}

\newcommand*{\bibliographyitemlabel}{}%

\newcommand*{\bibliographyhead}[1]{\section{#1}}
\AtEndPreamble{\@ifpackageloaded{multibib}{\renewcommand*{\bibliographyhead}[1]{\subsection{#1}}}{}}

\newenvironment{thebibliography}[1]{}{}
\newcommand*{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


% -------------------------------------------------------------------------------------------------
% Setup itemize, enumerate and description environment
% -------------------------------------------------------------------------------------------------
\setlength{\leftmargini}   {1em}
\leftmargin\leftmargini
\setlength{\leftmarginii}  {\leftmargini}
\setlength{\leftmarginiii} {\leftmargini}
\setlength{\leftmarginiv}  {\leftmargini}
\setlength{\leftmarginv}   {\leftmargini}
\setlength{\leftmarginvi}  {\leftmargini}
\setlength{\labelsep}      {.5em}%

\setlength{\labelwidth}    {\leftmargini}%
\addtolength{\labelwidth}  {-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\p@enumii(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}

\newcommand*\descriptionlabel[1]{\hspace\labelsep\normalfont\bfseries#1}


\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}


% -------------------------------------------------------------------------------------------------
% Setup design commands definitions
% -------------------------------------------------------------------------------------------------
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\renewcommand*{\date}[1]{\def\@date{#1}}\date{\today}
\newcommand*{\opening}[1]{\def\@opening{#1}}
\newcommand*{\closing}[1]{\def\@closing{#1}}

\newcommand*{\enclosure}[2][]{%
  \ifthenelse{\equal{#1}{}}{}{\renewcommand*{\enclname}{#1}}%
  \def\@enclosure{#2}%
}

\newcommand*{\recomputeletterlengths}{}

\newcommand*{\makelettertitle}{}

\newcommand*{\makeletterfooter}{\makefooter}

\newcommand*{\makeletterclosing}{}

\endinput


