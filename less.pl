#!/opt/local/bin/perl
use File::Basename;

opendir my($dh), 'less' or die "Couldn't open 'less': $!\n";
my @files = readdir $dh;
closedir $dh;

my $action = shift @ARGV;

if($action eq 'clean')
{
	foreach my $file (@files)
	{
		if(substr($file, 0, 1) eq '.')
		{
			next;
		}
		my ($filename) = fileparse($file, ".less");
		$product = "css/$filename.css";
		if(-e $product)
		{
			print "Cleaning $product\ ...\n";
			unlink $product or die "Could not remove '$product': $!\n";
		}
	}
}
else
{
	foreach my $file (@files)
	{
		if(substr($file, 0, 1) eq '.' || ! -f "less/$file")
		{
			next;
		}
	
		my($filename) = fileparse($file, ".less");
		my $product = "css/${filename}.css";
		print "Compiling '$file' to '$product' ...\n";
		if(-e $product)
		{
			rename $product, "$product.bak";
		}
		if(system("lessc less/${file} > $product") != 0)
		{
			if(-e "$product.bak")
			{
				rename "$product.bak", $product;	
			}
			die "lessc failed for $filename: $?\n";
		}
		unlink "$product.bak";
		if(-s $product == 0) #clear things like constants.less
		{
			unlink $product;
		}
	}
}