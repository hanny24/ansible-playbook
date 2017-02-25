function __fzf_alt_j
	fasd -l | fzf --tac +s > $TMPDIR/fzf.result
    if [ (cat $TMPDIR/fzf.result | wc -l) -gt 0 ]
      cd (cat $TMPDIR/fzf.result)
    end
    commandline -f repaint
end
