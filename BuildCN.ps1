# Build CN region-specific subset OTFs for all weights

$dirs = "ExtraLight", "Light", "Normal", "Regular", "Medium", "Bold", "Heavy"

foreach ($dir in $dirs)
{
	cd $dir
	makeotf -f cidfont.ps.CN -omitMacNames -ff features.CN -fi cidfontinfo.CN -mf ../FontMenuNameDB.SUBSET -r -nS -cs 25 -ch ../UniSourceHanSansCN-UTF32-H -ci ../SourceHanSans_CN_sequences.txt ; tx -cff +S -no_futile cidfont.ps.CN CFF.CN ; sfntedit -a CFF=CFF.CN SourceHanSansCN-$dir.otf
	Move-Item -Path .\*.otf -Destination ..\
	cd ..
}
