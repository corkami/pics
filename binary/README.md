# Basics of computing

- <a href="basics/hexadecimal.pdf">Hexadecimal</a>
- <a href="basics/colors.pdf">Colors</a>
- <a href="basics/image.pdf">Image</a>
  - Portable PixMap (1988-)
    - [Examples](basics/examples)
    - <a href="basics/ppm1.pdf">Portable PixMap 1/2</a>
    - <a href="basics/ppm2.pdf">Portable PixMap 2/2</a>


---

# Charsets and encodings

- ASCII American Standard Code for Information Interchange (1967)
  - <a href="charsets/ASCIIprintable.png">printable ASCII</a>
  - <a href="charsets/ASCII.png">complete</a>

- Code Pages
  - <a href="charsets/ASCII-DOS.png">IBM PC cp437</a>
  - <a href="charsets/codepages2.png">Icelandic cp861, Denmark/Norway cp865, Greek cp737 Windows-1252</a>
  - <a href="charsets/codepages1.png">Central European cp852, KOI8-R</a>

- <a href="charsets/EBCDIC.png">EBCDIC</a>: Extended Binary Coded Decimal Interchange Code (1964)

- <a href="charsets/apl0293.png">APL</a>: A Programming Language - EBCDIC CodePage 293 (1966)

- <a href="charsets/PETSCII.png">PETSCII</a> - PET Standard Code of Information Interchange / CBM ASCII (1977-)


---

# File formats

Containers:
- IFF: EA Interchange File Format (1985)
- RIFF: Resource Interchange File Format (1991)
- CFBF/CDFv2: Compound file binary format / Composite Document file v2 (DOCFILE / D0CF11E) (1997-2004)
- EBML: Extensible Binary Meta Language (2002)
- ISOBMFF: ISO Base Media File Format (2004?)


## Executables
- <a href="ELF.png">ELF - Executable and linkable format</a>

### Microsoft
- <a href="COM.png">Com (Dos [transient] commands)</a>

- Exe - MZ executable [DOS] (1981-)
  - <a href="exe.png">EXE</a>
  - <a href="exestub.png">EXE (PE Dos Stub)</a>

- <a href="pifdos.png">Pif - Program information File (Windows 1-, 1985-)</a>
- <a href="ne.png">NE - New Executable (Windows 1-2000, 1985-2000)</a>
- <a href="le.png">LE - Linear Executable (DOS, 1992)</a>
- <a href="PE.png">PE - Portable executable (Windows NT 3.1-, 1993-)</a>

### Apple
- <a href="rfrk.png">Rsrc - Resource fork (Mac System 1-, 1984)</a>
- <a href="pef.png">Pef - Preferred Executable Format (Mac System 7-9 , 1991-1999)</a>

- Macho - Mach Object (NeXTSTEP, MacOS, iOS)
  - <a href="MachO.png">(Little 32b)</a>
  - <a href="macho64.png">(Little 64b)</a>
  - <a href="machoppc.png">(Big 32b PowerPC)</a>
  - <a href="machoppc64.png">(Big 64b PowerPC)</a>

- <a href="fatmacho.png">Fat/Universal Mach-o</a>

### Others
- <a href="CLASS.png">Class - Java / JVM (1994)</a>
- <a href="DalvikEXecutable.pdf">DEX - Dalvik Executable [Android] (2008?)</a>
- <a href="SWF.png">Swf - ShockWave Flash / Small web file (1995?)</a>

- Dol - Nintendo Dolphin (Gamecube, Wii, 2001-2017)
  - <a href="dol.png">executable</a>
  - <a href="dolhdr.png">complete header</a>
- <a href="nro.png">NRO - NX (Nintendo Switch) Relocatable Object</a>

- <a href="off.png">OFF - OS/360 Object File format [EBCDIC] (1966?)</a>
- <a href="tos.png">Tos - GEMDOS Program format [Atari ST] (1985)</a>
- <a href="hunk.png">Hunk - Amiga Hunk [Commodore AmigaOS] (1985)</a>

- <a href="te.png">TE - Terse Executable [UEFI] (2017?)</a>
- <a href="wasm.png">Wasm - WebAssembly (2017)</a>

## Images
- <a href="PNG.png">Png - Portable Network graphics (1996)</a>
  - <a href="pngplus.png">Png Plus: a PNG with OLE chunks, by Microsoft Picture It!</a>
- <a href="JPG.png">Jpeg (JFIF) - Joint Photographic Experts Group - File Interchange Format (1992)</a>
- <a href="dicom.png">Dicom - Digital Imaging and Communications in Medicine (1985)</a>
- <a href="psd.png">Psd - PhotoShop Document (1990)</a>

- <a href="XBM.png">Xbm - X BitMap (X11 1989)</a>

- Netpbm (1988)
  - <a href="PGM.png">Pgm - Portable Graymap</a>
  - <a href="PPM.png">Ppm - Portable Pixmap</a>

- <a href="lbm.png">[I]Lbm - Interleaved Bitmap [IFF] (1985)</a>

- BMP - Bitmap [Windows 2 (1987)]
  - <a href="bmp1.png">v1</a>
  - <a href="bmp3.png">v3 (1991)</a>
  - <a href="bmp5.png">v5 (1998)</a>

- Gif - Graphics Interchange Format (1987)
- <a href="gif87.png">v87</a>
- <a href="gif89.png">v89, with a comment</a>

- TIFF - Tag Image File Format (1986)
  - <a href="TIFF_LE.png">little endian</a>
  - <a href="TIFF_BE.png">big endian</a>

- PCX - Zsoft Picture exchange [DOS] (1982)
  - <a href="pcx16.png">16 colors</a>
  - <a href="pcx256.png">256 colors</a>

- <a href="tga.png">TGA/TARGA - TrueVision [Advanced Raster] Graphics Adapter (1984)</a>

- ICO - Windows icon (1985)
  - <a href="ico_bmp.png"> w/ BMP (1995?)</a>
  - <a href="ico_png.png"> w/ PNG (2006)</a>

- <a href="pifimg.png">Pif - Portable Image Format (2022)</a>
- <a href="qoi.png">Qoi - Quite Ok Image (2021)</a>
- <a href="1ba.png">1ba - 1-bit animation (2023)</a>


## Videos
- <a href="mp4.png">Mp4 [ISOBMFF] (2001)</a>
- <a href="mkv.png">Mkv - Matroska video [EBML] (2002)</a>

- Y4M - Yuv4mpeg (2001)
  - <a href="y4m_mono.png">(mono)</a>
  - <a href="y4m_yuv.png">(yuv)</a>


## Archives

- [Zlib/Deflate/Zip/GZIP?](https://speakerdeck.com/ange/gzip-equals-zip-equals-zlib-equals-deflate)
- <a href="GZip.png">Gzip - GNU zip (1992)</a>

- <a href="ar.png">Ar - Archive (1971)</a>
- <a href="TAR.png">Tar - Tape archive (1979)</a>

- Copy [files] In & out [of archives] (1977)
  - <a href="cpio_bin.png">binary</a>
  - <a href="cpio_ascii.png">ASCII</a>

- <a href="ZIP.png">Zip - PkZip (1989)</a>

- Lzma - Lempel-Ziv-Markov chain algorithm (1998)
  - <a href="lzma.png">Lzma</a>
  - <a href="lzma_eos.png">with End of Stream marker</a>

- <a href="7zip.png">7zip (1999)</a>
- <a href="xz.png">Xz (2009)</a>

- <a href="cab.png">Cab - Microsoft Cabinet File (Mscf) (1995?)</a>
- <a href="rpm.png">Rpm - Redhat/RPM Package Manager (1997)</a>

- Rar - Roschal Archive (1993)
  - <a href="rar14.png">v1.4</a>
  - <a href="rar4.png">v4 (1996)</a>
  - <a href="rar5.png">v5 (2013)</a>

- <a href="arj.png">Arj - Archived by Robert Jung (1991?)</a>
- <a href="BZ2.png">bz2 - Bzip2 (1996)</a>

Wad - Where's all the data? (1993)
- <a href="wad_structure.png">(structure)</a>
- <a href="wad.png">(in Doom)</a>


- Zstd - Zstandard (2015)
  - <a href="zstd.png">Zstd</a>
  - <a href="zstd_skip.png">w/ Skippable frame</a>

- <a href="lz4.png">LZ4 (2011)</a>


## Documents
- <a href="eps.png">Eps - Encapsulated PostScript (1987)</a>
- <a href="PDF.png">Pdf - Portable document format (1992)</a>
- <a href="rtf.png">RTF - Rich text format (1987)</a>

- Microsoft Office
  - <a href="cfb.png">Msi - Microsoft Installer [CFB]</a>
  - <a href="wordml.png">Docm - WordML/WordProcessingML (Microsoft Office XML format) - XML (2002</a>
  - <a href="activemime.png">ActiveMime - MSO XML Bindata</a>
  - <a href="docx.png">Docx - Doc XML (Office Open XML) - ZIP+XMLs (2006)</a>

Multiplan - Excel:
- <a href="sylk.png">Sylk - Symbolic link - Multiplan 1 (1984-), Excel 1 (1986-)</a>

- Biff - Binary Interchange File Format
  - <a href="biff2.png">v2: v2, 1989 (raw)</a>
  - <a href="biff8.png">v8: 97-2003, 1998-2004 [CFB]</a>

- <a href="chm.png">CHM - Compiled HTML help - Info-Tech Storage Format (1997)</a>
- <a href="one.png">One - One Note (2014-)</a>

- Wmf - Windows Metafile Format (1992)
  - <a href="wmf2.png">Wmf</a>
  - <a href="wmf.png"> with Placeable header</a>

- <a href="emf.png">Emf - Enhanced Metafile Format (1993)</a>

## Sound
- <a href="8svx.png">8svx - 8-bit sample voice [Amiga][Iff] (1985)</a>

- AIFF - Audio interchange file format [Apple][Iff] (1988)
  - <a href="aiff.png">AIFF</a>
  - <a href="aiffc.png">AIFC / AIFF-C - Compressed (1991)</a>

- <a href="WAV.png">Wav - Waveform [Riff] (1991)</a>
- <a href="rmi.png">Rmi - Riff Midi [Riff]</a>

- <a href="midi.png">Midi - Musical Instrument Digital Interface</a>

## Metadata
- <a href="psd_iptc.png">IPTC IIM / International Press Telecommunications Council - Information Interchange Model (1991)</a>
- <a href="tiff_exif.png">Exif - Exchangeable Image File Format (1995)</a>
- <a href="xmp.png">XMP - Extensible Metadata Platform (2001)</a>

## Others
- <a href="mbr.png">Mbr+DPT - Master Boot Record with Disk Partitions Table (1983)</a>

- <a href="lnk.png">Lnk - Shell link [Windows] (1995?)</a>
- <a href="cdix.png">Cdix - ClangD Index [Riff] (2018)</a>

- <a href="hex.png"> Hex records - Intel[lec] Hexadecimal object (1973)</a>
- <a href="uf2.png"> Uf2 - USB Flashing format (2016)</a>


Opcodes:
- <a href="x64.png">x64</a>
- <a href="x86.png">x86</a>

## Weird files

<a href="unidoom.png">Universal Doom by Robert Xiao: functional DOS (Dos4/GW) and Portable Executable.</a>

<a href="zippng.png">A ZIP/PNG polyglot (sharing the deflate data) by Gynvael Coldwind.</a>

## 101

Dissection with more descriptions, and explanations (my initial style of binary posters).

source Inkscape SVGs and PoC with their sources are included

[PE 101](pe101/README.md)

<a href="pe101/README.md">PE 101 (light)</a>

### Others

<a href="elf101/elf101.pdf">ELF 101</a>,
<a href="zip101/zip101.pdf">ZIP 101</a>,
<a href="macho101/macho101.pdf">Mach-O 101</a>,
<a href="class101/class101.pdf">Class 101</a>,
<a href="pdf101/pdf101.pdf">PDF 101</a>,
<a href="com101/com101.pdf">COM 101</a>,
<a href="wav101/wav101.pdf">Wav 101</a>

## Structures

A layout of the various format's structures

<a href="pe102/pe102.pdf">PE 102</a>

# Opcodes' tables

Available in compact

<a href="opcodes_tables_complete.pdf">DVM JVM DotNet</a>

or 'with descriptions' formats

<a href="opcodes_tables_compact.pdf">DVM JVM DotNet (full)</a>

---
## Cryptography

Jneavat! N qnatrebhf pelcgbtencuvp bowrpg vf urnqvat lbhe jnl....

<a href="CryptoModes.png">Crypto modes</a>

<!-- pandoc -s -f gfm -t html README.md -o README.html -->
