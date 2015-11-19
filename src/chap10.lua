--Exercise 10.1
N=8
local solved=false
local function printBoard(board)
	if solved then
		return 
	end
	for i=1, N do
		for j=1, N do
			io.write(board[i]==j and "X" or "-", " ")
		end
		io.write("\n")
	end
	io.write("\n")
	solved = true
end
local function validPos(board, row, pos)
	for i=1, row-1 do
		if (board[i] == pos) or
			(row-i == math.abs(pos - board[i])) then
			return false
		end
	end
	return true
end

local function addQueen(board, n)
	if n>N then
		printBoard(board)
	else
		for pos=1, N do
			if validPos(board, n, pos) then
				board[n]=pos
				addQueen(board, n+1)
			end
		end
	end
end

addQueen({},1)
