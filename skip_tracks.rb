# Code is cooked here:) 
# Time Complexity:  O(n*l)	
# Space Complexity: O(1)

def skip_tracks(hash,n)           
	l=hash.length()
	n=n%l
	for i in (0...n)              
		temp = hash[0]
		j=0
		for j in (0...l-1)
			hash[j]=hash[j+1]	
		end
		hash[j+1]=temp
	end
	for i in (0..l) 
	 print "#{hash[i]} " 
	end 
end

playlist = gets.chomp.split(",") #Input: All songs seperated by ',' in single line
hash=Hash.new()
	k=0
	playlist.each {               
		|pi|
		hash[k]=pi
		k=k+1
	}
t=gets.chomp.to_i				 #Test cases
for i in (1..t)					
	n=gets.chomp.to_i			 #No. of songs to be skipped		
	skip_tracks(hash,n)
	puts ""
end