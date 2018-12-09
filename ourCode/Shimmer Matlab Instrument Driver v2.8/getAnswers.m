function getAnswers(Scores,Measures)

%For setting up matrixes:
%Scores = [H1S(1),Y1S(1),P2S(1),H1S(2),Y1S(2),P2S(2),H1S(3),Y1S(3),P2S(3);H2S(1),Y2S(1),P3S(1),H2S(2),Y2S(2),P3S(2),H2S(3),Y2S(3),P3S(3);H3S(1),Y3S(1),P4S(1),H3S(2),Y3S(2),P4S(2),H3S(3),Y3S(3),P4S(3)]
%Measures = D(1),H1D(2),Y1D(2),P2D(2),H1D(3),Y1D(3),P2D(3);H2D(1),Y2D(1),P3D(1),H2D(2),Y2D(2),P3D(2),H2D(3),Y2D(3),P3D(3);H3D(1),Y3D(1),P4D(1),H3D(2),Y3D(2),P4D(2),H3D(3),Y3D(3),P4D(3)]

%Statistics for scores and measures:
[pScoreAvg,pScoreAvgMult] = bonferonni(Scores(:,1:3))
[pLeng,pLengMult] = bonferonni(Measures(:,1:3))
[pSpan,pSpanMult] = bonferonni(Measures(:,4:6))
[pFreq,pFreqMult] = bonferonni(Measures(:,7:9))