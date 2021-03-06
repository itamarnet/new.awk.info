BEGIN {
    n = ARGV[1] + 0 # iterations
    if (n !~ /^[0-9]+$/) { exit(1) }
    if (n == 0) { width = 3 }
    row = split("X,X X,X   X,X X X X",A,",") # seed the array
    for (i=1; i<=n; i++) { # build triangle
      width = length(A[row])
      for (j=1; j<=row; j++) {
        str = A[j]
      # if (n <= 9) { gsub(/[^ ]/,i,str) } # show structure
        A[j+row] = sprintf("%-*s %-*s",width,str,width,str)
      }
      row *= 2
    }
    for (j=1; j<=row; j++) { # print triangle
      if (X != "") { gsub(/X/,substr(X,1,1),A[j]) }
      sub(/ +$/,"",A[j])
      printf("%*s%s\n",width-j+1,"",A[j])
    }
    exit(0)
}
