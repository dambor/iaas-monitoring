for i in `cat $1 | grep HVM`                                                                                                          [±master ✓]
do
  instance=`echo $i | awk -F, '{print $1}'`
  vcpu=`echo $i | awk -F, '{print $2}'`
  for y in `cat $2 | grep "$instance"`
  do
    memory=`echo $y | awk -F, '{print $2}'`
    cost=`echo $y | awk -F, '{print $3}'`
#    echo "((($memory/3.75)+$vcpu)/$cost)" | bc
    cost_benefit=`echo "(($memory/3.75)+$vcpu)" | bc -l`
    #cost_benefit=`echo "$a/$cost" | bc -l`
    echo $cost_benefit","$instance >> lista.txt
  done
done
echo "As instância com melhor custo benefício são:"
echo " "
cat lista.txt | sort -n -r | awk -F, '{print $2}' > output.txt
rm lista.txt
num=1
for i in `cat output.txt`
do
  echo $num". "$i
  num=`echo "$num+1" | bc -l`
done
rm output.txt
