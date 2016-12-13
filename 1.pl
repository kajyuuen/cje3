# tf_idf.prl
$idf{'dog'} = 2.5;
$idf{'cat'} = 1.6;
$idf{'year'} = 3.3;
$tf{'dog'}{'D001'} = 10;
$tf{'dog'}{'D002'} = 3;
$tf{'dog'}{'D005'} = 22;
$tf{'dog'}{'D009'} = 7;
$tf{'cat'}{'D002'} = 14;
$tf{'cat'}{'D005'} = 13;
$tf{'cat'}{'D009'} = 6;
$tf{'year'}{'D003'} = 9;
$tf{'year'}{'D005'} = 8;
$tf{'year'}{'D007'} = 10;
$tf{'year'}{'D009'} = 2;
$tf{'year'}{'D010'} = 2;
# IDFを表示する
print "=== IDF ===\n";
foreach $term (sort keys %idf) {
    print "idf($term) = $idf{$term}\n";
}
print "\n";
# TFを表示する
print "=== TF ===\n";
foreach $term (sort keys %tf) {
    foreach $docid (sort keys %{$tf{$term}}) {
	print "tf($term,$docid) = $tf{$term}{$docid}\n";
    }
}

# TF*IDF
print "\n=== TF*IDF ===\n";
foreach $term (sort keys %tf) {
    foreach $docid (sort keys %{$tf{$term}}) {
	$num = $tf{$term}{$docid}*$idf{$term};
	print "tf($term,$docid)*idf($term) = $num\n";
    }
}
