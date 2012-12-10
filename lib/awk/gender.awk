                                          { sex = "m" } # Assume male.

/^.*[aeiy]$/                              { sex = "f" }  # Female names endng in a/e/i/y.
/^All?[iy]((ss?)|z)on$/                   { sex = "f" }  # Allison (and variations)
/^.*een$/                                 { sex = "f" }  # Cathleen, Eileen, Maureen,...
/^[^S].*r[rv]e?y?$/                       { sex = "m" }  # Barry, Larry, Perry,...
/^[^G].*v[ei]$/                           { sex = "m" }  # Clive, Dave, Steve,...
/^[^BD].*(b[iy]|y|via)nn?$/               { sex = "f" }  # Carolyn,Gwendolyn,Vivian,...
/^[^AJKLMNP][^o][^eit]*([glrsw]ey|lie)$/  { sex = "m" }  # Dewey, Stanley, Wesley,...
/^[^GKSW].*(th|lv)(e[rt])?$/              { sex = "f" }  # Heather, Ruth, Velvet,...
/^[CGJWZ][^o][^dnt]*y$/                   { sex = "m" }  # Gregory, Jeremy, Zachary,...
/^.*[Rlr][abo]y$/                         { sex = "m" }  # Leroy, Murray, Roy,...
/^[AEHJL].*il.*$/                         { sex = "f" }  # Abigail, Jill, Lillian,...
/^.*[Jj](o|o?[ae]a?n.*)$/                 { sex = "f" }  # Janet, Jennifer, Joan,...
/^.*[GRguw][ae]y?ne$/                     { sex = "m" }  # Duane, Eugene, Rene,...
/^[FLM].*ur(.*[^eotuy])?$/                { sex = "f" }  # Fleur, Lauren, Muriel,...
/^[CLMQTV].*[^dl][in]c.*[ey]$/            { sex = "m" }  # Lance, Quincy, Vince,...
/^M[aei]r[^tv].*([^cklnos]|([^o]n))$/     { sex = "f" }  # Margaret, Marylou, Miriam,...
/^.*[ay][dl]e$/                           { sex = "m" }  # Clyde, Kyle, Pascale,...
/^[^o]*ke$/                               { sex = "m" }  # Blake, Luke, Mike,...
/^[CKS]h?(ar[^lst]|ry).+$/                { sex = "f" }  # Carol, Karen, Sharon,...
/^[PR]e?a([^dfju]|qu)*[lm]$/              { sex = "f" }  # Pam, Pearl, Rachel,...
/^.*[Aa]nn.*$/                            { sex = "f" }  # Annacarol, Leann, Ruthann,...
/^.*[^cio]ag?h$/                          { sex = "f" }  # Deborah, Leah, Sarah,...
/^[^EK].*[grsz]h?an(ces)?$/               { sex = "f" }  # Frances, Megan, Susan,...
/^[^P]*([Hh]e|[Ee][lt])[^s]*[ey].*[^t]$/  { sex = "f" }  # Ethel, Helen, Gretchen,...
/^[^EL].*o(rg?|sh?)?(e|ua)$/              { sex = "m" }  # George, Joshua, Theodore,..
/^[DP][eo]?[lr].*se$/                     { sex = "f" }  # Delores, Doris, Precious,...
/^[^JPSWZ].*[denor]n.*y$/                 { sex = "m" }  # Anthony, Henry, Rodney,...
/^K[^v]*i.*[mns]$/                        { sex = "f" }  # Karin, Kim, Kristin,...
/^Br[aou][cd].*[ey]$/                     { sex = "m" }  # Bradley, Brady, Bruce,...
/^[ACGK].*[deinx][^aor]s$/                { sex = "f" }  # Agnes, Alexis, Glynis,...
/^[ILW][aeg][^ir]*e$/                     { sex = "m" }  # Ignace, Lee, Wallace,...
/^[^AGW][iu][gl].*[drt]$/                 { sex = "f" }  # Juliet, Mildred, Millicent,...
/^[ABEIUY][euz]?[blr][aeiy]$/             { sex = "m" }  # Ari, Bela, Ira,...
/^[EGILP][^eu]*i[ds]$/                    { sex = "f" }  # Iris, Lois, Phyllis,...
/^[ART][^r]*[dhn]e?y$/                    { sex = "m" }  # Randy, Timothy, Tony,...
/^[BHL].*i.*[rtxz]$/                      { sex = "f" }  # Beatriz, Bridget, Harriet,...
/^.*oi?[mn]e$/                            { sex = "m" }  # Antoine, Jerome, Tyrone,...
/^D.*[mnw].*[iy]$/                        { sex = "m" }  # Danny, Demetri, Dondi,...
/^[^BG](e[rst]|ha)[^il]*e$/               { sex = "m" }  # Pete, Serge, Shane,...
/^[ADFGIM][^r]*([bg]e[lr]|il|wn)$/        { sex = "f" }  # Angel, Gail, Isabel,...

                                          { print sex }  # Output prediction

## awk.info:
## AWK Example: gender.awk
##
## This AWK example was downloaded from the 'http://awk.info' website.
##
## Author:
##  Scott Pakin, August 1991
##
