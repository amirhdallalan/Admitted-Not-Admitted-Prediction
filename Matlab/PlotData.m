function PlotData(X, y)

  pos = find(y==1);
  neg = find(y==0);

  figure;
  plot(X(pos, 1), X(pos, 2), 'go');
  hold on;
  plot(X(neg, 1), X(neg, 2), 'rx')
  hold off;
end