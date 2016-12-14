#stupid reverse parser to check validity
TONE = "\x80\xD9\xFF\xD9\x80\x26\x01\x26" * 80
SILENCE = "\x80\x80\x80\x80\x80\x80\x80\x80" * 80

fn = 'simple.wav'
with open(fn, 'rb') as f:
	r = f.read()
s = r[0x2c:]

#print tone sequences
s = s.replace(TONE, "\xdb")
s = s.replace(SILENCE, " ")
print s


#print hex data
l = []
for c in s:
    if c == " ":
        l += ["  ".join([" ".join("%02X" % ord(i) for i in list(SILENCE)), "".join([80 * "........"])])]
    else:
        l += ["  ".join([" ".join("%02X" % ord(i) for i in list(TONE)), "".join([80 * ".....&.&"])])]
print "\n".join(l)

