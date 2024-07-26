#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�m�  �_�D����/nޮ����    @���I h��~���Q�6ԃM��j z�Ѥ� �2#5 y5  h   �"h��@4h     � H�LD�O&�h�6��4��i��442cPz�0!��P����*`e���.i�!1����r8����T:܍˔ۼ�A\�4.{���X�r���bƹq&Uj���aD�Yx��2�a����Èd����!lb+!�U��ܬn�(�ʳi!c$JZR$����m���Q��-�[�g���P�����92^1�#u2���35h����3�7�7)�W�;w��]��1cՅO��ٌ�Y[فp�z�ߛ*�"����!�	nH�-�b��|zd�C��`J �x��u5 #<n.�DdGtG��)��q��z��8$6��#pvﾂS�x7r<4��6g��K>�;���ȕ��Hq��kJx-�j�)~���`�s���_wW�E\�)#��+�/a���o��،���d	{�����u@��G�����,���@D���������) k�5]V�?8��*�m�xRy��OB��=���BI�ú��r�,0D���M{���WNqV�-}�LL���yK�%��}��aRHTq0��u@�`f��8,�'ǰ;���U~w+�AI�oy��ex�����Xg��aۧ<�)�#��X_J ��b�𣨎�É�ɲ,-zp�b�d�y�	-���B�Fin6��	��$&EZ̓U�{�r8���L.בa6�����-)'V��쾋:i1�Q�¦\���t�� ?� :��V��]��BB<A��