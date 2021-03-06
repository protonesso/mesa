mul(8)          m3<1>F          g2<8,8,1>F      g8<8,8,1>F      { align1 1Q };
mul(16)         m5<1>F          g2<8,8,1>F      g14<8,8,1>F     { align1 1H };
mul(8)          g7<1>F          g44<8,8,1>F     g4.1<0,1,0>F    { align1 1Q };
mul(16)         g18<1>F         g28<8,8,1>F     g6.1<0,1,0>F    { align1 1H };
mul(8)          g39<1>.xD       g28<4>.xD       g5<0>.xD        { align16 1Q };
mul(8)          g39<1>.xD       g39<4>.xD       2D              { align16 1Q };
mul(8)          g38<1>.xF       g2<0>.yF        g2<0>.yF        { align16 1Q };
mul(8)          m4<1>.xyF       g6<4>.xyyyF     0x3f000000F  /* 0.5F */ { align16 NoDDClr 1Q };
mul(8)          g8<1>F          g3<4>F          0x37800000F  /* 1.52588e-05F */ { align16 1Q };
mul(8)          g2<1>F          g5<8,8,1>F      0x40490fdbF  /* 3.14159F */ { align1 1Q };
mul(16)         g2<1>F          g7<8,8,1>F      0x40490fdbF  /* 3.14159F */ { align1 1H };
mul(8)          m4<1>F          g12<4>F         0x3b808081F  /* 0.00392157F */ { align16 1Q };
mul(8)          g61<1>UD        g61<4>UD        0x00000003UD    { align16 1Q };
mul(8)          m1<1>F          g6<8,8,1>F      0x3c23d70aF  /* 0.01F */ { align1 1Q };
mul(16)         m1<1>F          g10<8,8,1>F     0x3c23d70aF  /* 0.01F */ { align1 1H };
mul(8)          g41<1>F         g40<4>.yF       0x3000VF /* [0F, 1F, 0F, 0F]VF */ { align16 1Q };
mul(8)          g3<1>.wF        g23<4>.xF       0x3f000000F  /* 0.5F */ { align16 NoDDClr 1Q };
mul.sat(8)      g10<1>F         g9<8,8,1>F      0x40a00001F  /* 5F */ { align1 1Q };
mul.sat(16)     g13<1>F         g11<8,8,1>F     0x40a00001F  /* 5F */ { align1 1H };
mul(8)          acc0<1>UD       g10<8,8,1>UD    0xaaaaaaabUD    { align1 1Q };
mul(8)          acc0<1>D        g10<8,8,1>D     1431655766D     { align1 1Q };
mul(8)          g14<1>D         g14<8,8,1>D     g13<8,8,1>D     { align1 1Q };
mul(16)         acc0<1>UD       g14<8,8,1>UD    0xaaaaaaabUD    { align1 1H };
mul(16)         acc0<1>D        g14<8,8,1>D     1431655766D     { align1 1H };
mul(16)         g21<1>D         g23<8,8,1>D     g19<8,8,1>D     { align1 1H };
mul(8)          m4<1>.yF        g12<4>.xF       0x3b800000F  /* 0.00390625F */ { align16 NoDDChk 1Q };
mul(8)          g3<1>D          g2<0,1,0>UW     g2.2<0,1,0>D    { align1 1Q };
mul(16)         g3<1>D          g2<0,1,0>UW     g2.2<0,1,0>D    { align1 1H };
mul(8)          acc0<1>D        g1<0>D          g1.4<0>D        { align16 1Q };
mul.l.f0.0(8)   g20<1>F         g2<8,8,1>F      0x42700000F  /* 60F */ { align1 1Q };
mul.l.f0.0(16)  g14<1>F         g2<8,8,1>F      0x42700000F  /* 60F */ { align1 1H };
mul(8)          m3<1>.xF        g15<4>.xF       0x40a66666F  /* 5.2F */ { align16 NoDDClr,NoDDChk 1Q };
mul.sat(8)      m4<1>F          g6<4>F          0x3b800000F  /* 0.00390625F */ { align16 1Q };
mul(8)          acc0<1>D        g1<4>.xD        741092396D      { align16 1Q };
mul(8)          acc0<1>UD       g4<8,8,1>UD     g8<8,8,1>UD     { align1 1Q };
mul(16)         acc0<1>UD       g4<8,8,1>UD     g12<8,8,1>UD    { align1 1H };
mul(8)          m3<1>.xyzF      g2<4>.xyzzF     g11<4>.xF       { align16 NoDDClr 1Q };
mul.sat(8)      m2<1>F          g6<8,8,1>F      g5<8,8,1>F      { align1 1Q };
mul.sat(16)     m2<1>F          g12<8,8,1>F     g10<8,8,1>F     { align1 1H };
mul(8)          acc0<1>D        g5<8,8,1>D      g9<8,8,1>D      { align1 1Q };
mul(16)         acc0<1>D        g5<8,8,1>D      g13<8,8,1>D     { align1 1H };
mul.sat(8)      m4<1>F          g2<4>F          g2<4>F          { align16 1Q };
mul(8)          m3<1>F          g2<4>F          g3<4>F          { align16 1Q };
mul(8)          g3<1>D          g2<0,1,0>UW     1774483385D     { align1 1Q };
mul(16)         g3<1>D          g2<0,1,0>UW     1774483385D     { align1 1H };
mul(8)          g15<1>.zF       g61<4>.xF       0x3e800000F  /* 0.25F */ { align16 NoDDClr,NoDDChk 1Q };
mul(8)          acc0<1>UD       g22<4>.xUD      0x80000001UD    { align16 1Q };
mul.nz.f0.0(8)  g6<1>F          g12<8,8,1>F     0x3f808000F  /* 1.00391F */ { align1 1Q };
mul.nz.f0.0(16) g9<1>F          g7<8,8,1>F      0x3f808000F  /* 1.00391F */ { align1 1H };
mul.sat(8)      m4<1>.xyF       g1<0>.wzzzF     g3<4>.wzzzF     { align16 NoDDClr 1Q };
mul.sat(8)      m4<1>.zwF       g1<0>.yyyxF     g3<4>.yyyxF     { align16 NoDDChk 1Q };
mul.sat(8)      m4<1>F          g4<4>F          0x20303030VF /* [1F, 1F, 1F, 0.5F]VF */ { align16 1Q };
mul(8)          g4<1>.xyzF      g16<4>.zyxxF    g20<4>.xF       { align16 NoDDClr 1Q };
mul(8)          acc0<1>UD       g9<4>UD         g11<4>UD        { align16 1Q };
mul(8)          m4<1>F          g3<4>F          0x20305454VF /* [5F, 5F, 1F, 0.5F]VF */ { align16 1Q };
mul(8)          m4<1>.xyzF      g3<4>.xyzzF     0x30302020VF /* [0.5F, 0.5F, 1F, 1F]VF */ { align16 NoDDClr 1Q };
mul(8)          g3<1>.wF        g1<0>.zF        g11<4>.xF       { align16 NoDDClr,NoDDChk 1Q };
mul(8)          m4<1>.yF        g15<4>.xF       g11<4>.xF       { align16 NoDDClr,NoDDChk 1Q };
mul(8)          m5<1>.yF        g31<4>.xF       g11<4>.xF       { align16 NoDDChk 1Q };
mul(8)          m17<1>D         g10<8,8,1>D     g9<8,8,1>D      { align1 1Q };
mul(16)         m17<1>D         g16<8,8,1>D     g14<8,8,1>D     { align1 1H };
mul.sat(8)      m4<1>.xyzF      g12<4>.xF       0x3030VF /* [1F, 1F, 0F, 0F]VF */ { align16 NoDDClr 1Q };
