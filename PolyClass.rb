# cooked my code here
class Polynomial
	def initialize(a) # Adhoc Logic :)
	    	k=a.length()-1
	    	ans=""
			a.each	{ |ai|
				if ai!='0'
					if ai>'0'	
						ans+='+'
						ans+=ai if ai!='1' || k==0   	
					else
						ai!='-1' || k==0 ? ans+=ai : ans+='-'
					end	
					if k>=2
						ans+="x^#{k}"
					elsif k==1
						ans+='x'
					end
				end
				k=k-1
			}
			term=1
			for i in (1...ans.length())
				term+=1 if ans[i]=='+' || ans[i]=='-'
			end		
			print term<2 ? "Argument Error!" : ans[0]!='+' ? ans : ans[1,ans.length()-1]					 	
	end	
end

t=gets.chomp.to_i         					#Test Cases
for i in(1..t)            					#Iterating Test Cases 
	a=gets.chomp.split(",")					#Coefficient Array is input,each entry is seperated by ','	
	obj=Polynomial.new(a)
	puts ""    				
end




