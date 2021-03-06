% Document Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{card}
\LoadClass[10pt, a4paper]{article}

% Include
\RequirePackage{include/bhh}

% Layout
\usepackage{fullpage}

% Spacing
\RequirePackage{enumitem}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\lineskip}{0pt}
\setlist{leftmargin=2em,font=\bfseries}

% 10.5cm x 5.45cm
\setlength{\fboxrule}{0pt}
\setlength{\fboxsep}{0.5cm}

% Card
\newsavebox{\mybox}
\newenvironment{BHHCard}[6]{%
  \def\bgcmd{\ImgBackground{#3}{5.45cm}}%
  \def\symbolcmd{\ImgSymbol{#3}{0.5cm}}%
  \def\seriescmd{\ImgSeries{#4}{1em}}%
  \def\usagecmd{\Usage*{#5}}%
  \def\footercmd{#6}%
  \begin{lrbox}{\mybox}%
    \begin{minipage}[t][\dimexpr10.5cm-2\fboxsep-2\fboxrule\relax]{\dimexpr5.45cm-2\fboxsep-2\fboxrule\relax}%
      ~\par%
      { \centering%
        {\FontTitle \Large #1} \par%
        {\FontTitleEn \small \textcolor{milk-dark}{\uppercase{#2}}} \par%
      }%
      \vspace*{0.5em}%
      \small%
}{%
      \vfill%
      \small%
      { \centering \symbolcmd \par }%
      \footercmd%
    \end{minipage}%
  \end{lrbox}%
  %
  \sbox\mybox{\fbox{\usebox\mybox}}%
  \mbox{%
    \rlap{\raisebox{\dimexpr-\dp\mybox}{\bgcmd}}%
    \rlap{\raisebox{-0.5\fboxsep}{\hspace*{\fboxsep}\mbox{\usagecmd}}}%
    \usebox\mybox%
    \llap{\raisebox{-0.5\fboxsep}{\seriescmd\hspace*{\fboxsep}}}%
  }%
}

% Card Story
\newenvironment{CardStory}{%
  \centering \FontStory \footnotesize%
}{%
  \par\vspace*{-0.5em}%
  \hfil{\textcolor{milk-dark}{\rule{\textwidth}{0.4pt}}}\hfil%
}

% Event Card
\newenvironment{EventCard}[2]{%
  \def\ThisName{\Event*{#2}}%
  \begin{BHHCard}{\ThisName}{#2}{event}{#1}{}{~}%
}{%
  \end{BHHCard}%
}
\newenvironment{EventCardSp}[3]{%
  \begin{BHHCard}{#3}{#2}{event}{#1}{}{~}%
}{%
  \end{BHHCard}%
}

% Item Card
\newenvironment{ItemCard}[3]{%
  \def\ThisName{\Item*{#2}}%
  \begin{BHHCard}{\ThisName}{#2}{item}{#1}{#3}{~}%
}{%
  \end{BHHCard}%
}

% Omen Card
\newenvironment{OmenCard}[3]{%
  \def\ThisName{\Omen*{#2}}%
  \begin{BHHCard}{\ThisName}{#2}{omen}{#1}{#3}{請立即進行\Roll{Haunt}。}%
}{%
  \end{BHHCard}%
}
