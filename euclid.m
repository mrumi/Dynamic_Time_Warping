function dist = euclid(tm1, tm2)
  dist = sum((tm1 - tm2).^2);
end