local a=shield.getShieldHitpoints()if a<last_shield_hp then local b=a/shieldMaxHP*100;local c=last_shield_hp-a;local d=c/shieldMaxHP*100;damage=maxSHP*d*0.01;svghp=maxSHP*b*0.01;last_shield_hp=a end;lastShotTime=system.getArkTime()shoteCount=shoteCount+1;local e=shield.getStressRatioRaw()AM_stress=e[1]EM_stress=e[2]KI_stress=e[3]TH_stress=e[4]if shield.getResistancesCooldown()==0 and shoteCount>=5 and GHUD_shield_auto_calibration then local f=shield.getResistances()local g=getRes(e,resMAX)if GHUD_shield_calibration_max then if f[1]==g[1]and f[2]==g[2]and f[3]==g[3]and f[4]==g[4]then else if shield.setResistances(g[1],g[2],g[3],g[4])==1 then system.print("Shield power has been set to max stress")actionRes(g)system.playSound('shieldNewResists.mp3')end end else local h=gR2D(e)[1]local i=gR2D(e)[2]local j=gR2D(e)[3]local k=gR2D(e)[4]if h==f[1]and i==f[2]and j==f[3]and k==f[4]then else if shield.setResistances(h,i,j,k)==1 then system.print("Shield power has been split 50/50%")local l={h,i,j,k}actionRes(l)system.playSound('shieldNewResists.mp3')end end end end