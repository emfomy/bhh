% Document Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{card}
\LoadClass[10pt, a4paper]{article}

% Include
\RequirePackage{lib/bhh}

% Layout
\RequirePackage{fullpage}

% Spacing
\RequirePackage{enumitem}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\lineskip}{0pt}
\setlist{leftmargin=2em,font=\bfseries}

% 10.5cm x 5.45cm
\newlength\CardHeight
\setlength{\CardHeight}{10.5cm}
\newlength\CardWidth
\setlength{\CardWidth}{5.45cm}
\newlength\CropLength
\setlength{\CropLength}{1cm}
\newlength\CropWidth
\setlength{\CropWidth}{1pt}

\setlength{\fboxrule}{0pt}
\setlength{\fboxsep}{0.5cm}

% Crop Marks
\RequirePackage{eso-pic}
\newcommand{\DrawCropMarks}{%
  \AtTextUpperLeft{%
    \begin{picture}(0,0)(\dimexpr.5\CropLength\relax, \dimexpr.5\CropWidth\relax)
      \put(\dimexpr0\CardWidth-\CropLength\relax, \dimexpr-1\CardHeight\relax){\rule{\CropLength}{\CropWidth}}% left
      \put(\dimexpr3\CardWidth+\CropLength\relax, \dimexpr-1\CardHeight\relax){\rule{\CropLength}{\CropWidth}}% right
    \end{picture}
  }%

  \AtTextUpperLeft{%
    \begin{picture}(0,0)(\dimexpr.5\CropWidth\relax, \dimexpr.5\CropLength\relax)
      \put(\dimexpr1\CardWidth\relax, \dimexpr0\CardHeight+\CropLength\relax){\rule{\CropWidth}{\CropLength}}% top1
      \put(\dimexpr2\CardWidth\relax, \dimexpr0\CardHeight+\CropLength\relax){\rule{\CropWidth}{\CropLength}}% top2

      \put(\dimexpr1\CardWidth\relax, \dimexpr-2\CardHeight-\CropLength\relax){\rule{\CropWidth}{\CropLength}}% bottom1
      \put(\dimexpr2\CardWidth\relax, \dimexpr-2\CardHeight-\CropLength\relax){\rule{\CropWidth}{\CropLength}}% bottom2
    \end{picture}
  }%
}
\AddToShipoutPictureFG{\DrawCropMarks}

% Card
\newsavebox{\mybox}
\newenvironment{BHHCard}[6]{%
  \def\ThisName{#1}%
  \def\bgcmd{\ImgBackground{#3}{\CardWidth}}%
  \def\symbolcmd{\ImgSymbol{#3}{0.5cm}}%
  \def\seriescmd{\ImgSeries{#4}{1em}}%
  \def\usagecmd{\Usage*{#5}}%
  \def\footercmd{#6}%
  \begin{lrbox}{\mybox}%
    \begin{minipage}[t][\dimexpr\CardHeight-2\fboxsep-2\fboxrule\relax]{\dimexpr\CardWidth-2\fboxsep-2\fboxrule\relax}%
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
  \begin{BHHCard}{\Event*{#2}}{#2}{event}{#1}{}{~}%
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
  \begin{BHHCard}{\Item*{#2}}{#2}{item}{#1}{#3}{~}%
}{%
  \end{BHHCard}%
}

% Omen Card
\newenvironment{OmenCard}[3]{%
  \begin{BHHCard}{\Omen*{#2}}{#2}{omen}{#1}{#3}{請立即進行\Roll{Haunt}。}%
}{%
  \end{BHHCard}%
}
