# assume number of elts: n is in $1, base address of A is in $2

# Registers:
#   $3  result: sum
#   $4  address of top of loop
#   $5  incrementer
#   $6  value of a_i
#   $7  temp used to store branching condition (n - $5)

add     $3, $0, $0  # load value 0 into sum
add     $5, $0, $0  # load value 0 into incrementer
ldpc    $4, 1       # load the address of the next instruction

# loop
ld      $6, $2      # load next a_i
inc     $5, $5      # increment loop counter
inc     $2, $2      # move the array index to the next elt
add     $3, $3, $6  # add a_i to sum
sub		$7, $5, $1  # get i - n
brn     $4          # branch to top of loop if i - n < 0

nop
nop
