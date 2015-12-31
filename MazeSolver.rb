# cooked my code here :P
$a=Array.new(100)     							#Given Maze
$vi=Array.new(100)  { Array.new(100) }			#Visited or Not visited Array
$ans=Array.new(100) { Array.new(100) }  		#Answer path
$startx=0,$starty=0,$endx=0,$endy=0,$n=0,$m=0   #n,m Dimensions - Rows and Columns

def Solve(x,y) 
    if x == $endx && y == $endy        			#If you reached the end,Yes! Obviously:) 
    	return true; 
    end
    if $a[x][y] == '#' || $vi[x][y]==1 			#If you are on a wall or visited latice 
    	return false;
    end
    $vi[x][y] = Integer(1);         			#Possible Vertex
    if x != 0                       			#Checks if top 
        if Solve(x-1, y)            			
            $ans[x][y] = 1;      
            return true;
        end
    end
    if x != $n - 1 		            			#Checks if bottom edge
        if Solve(x+1, y)            			#Recalls method one to the right
            $ans[x][y] = 1;
            return true;
        end
    end
    if y != 0                       			#Checks if left most edge
        if Solve(x, y-1)            			#Recalls method one up
            $ans[x][y] = 1;
            return true;
        end
    end
    if y != $m-1                				#Checks if right most edge
        if Solve(x, y+1)            			#Recalls method one down
            $ans[x][y] = 1;
            return true;
        end
    end
    return false;
end

def solvemaze()
	for i in (0...$n)
		for j in (0...$m)
			$ans[i][j]=0 						#No Path Initially
			$vi[i][j]=0 						#Not Visited Initially	
		end
	end
	p=Solve($startx,$starty)					
	return p
end

$n=gets.chomp.to_i               				#Number Of Lines
$m=gets.chomp.to_i				 				#Length Of Each Line
for j in(0...$n)
	$a[j]=gets.chomp
end	    
for i in (0...$n)
   		for j in (0...$m)
 			if $a[i][j]=='A'
 				$startx=i,$starty=j
 			end
 			if $a[i][j]=='B'
 				$endx=i,$endy=j			
    		end
    	end
end		    
q=solvemaze()
if q==true
	$ans[$startx][$starty]='A'
	$ans[$endx][$endy]='B' 						#Solution Matrix - 1 represents the path 
	for i in (0...$n)
   		for j in (0...$m)
    		print "#{$ans[i][j]}"
    	end
		puts ""
	end
else
	puts "No Path!"
end				

	