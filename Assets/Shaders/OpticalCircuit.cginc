float A;
float D(float3 C) { return frac(sin((C.x+C.y+C.z)*99.317*3.1415926546)*85.081*3.1415926546); }
float E() { return frac(sin(A*99.317*3.1415926546)*85.081*3.1415926546); }

float3 F(float3 a,float b)
{
    float c=sin(b),d=cos(b);
    return mul(float3x3(d,-c,0,c,d,0,0,0,1), a);
}

float3 G(float3 a,float b)
{
    a=frac(a*.2)*2-1;
    a.z=b;
    float c=50;
    for(int i=0; i<6+z(16)+z(32)*3; ++i) {
        float d=clamp(dot(a,a),.05,.65);
        c*=d;
        a=abs(a)/d-1.31;
        a.xy=mul(a.xy,transpose(float2x2(1,1,-1,1))*.70710678118);
    }
    return a*c;
}

float3 H(float3 a)
{
    float b=3+z(4)*4;
    a=F(a,(floor(atan2(a.y,a.x)*b*.5/3.1415926546)*2+1)*3.1415926546/b);
    a.y=abs(a.y);
    return a;
}

float3 I(float3 a)
{
    a.z-=A*1.5;
    float b=A*.5+floor(a.z);
    return F(float3(a.x,a.y+sin(b),frac(a.z)-.5),3.1415926546-cos(b));
}

float3 Z(float t)
{
    return float3(0,-sin(t*.6),t*1.6+.5)+sin(t*.01*float3(11,23,19))*float3(.135,.25,.25);
}

float J(float3 a)
{
    float3 b=abs(frac(a*5)-.5)*.2;
    return max(max(b.x,b.y),b.z)-.078;
}

float K(float3 a)
{
    float3 b=abs(frac(a*2)-.5)*.5;
    return max(max(b.x,b.y),b.z);
}

float L(float3 a)
{
    float3 b=abs(frac(a+float3(0,.5,0))-.5),c=abs(frac(a+.5)-.5);
    return .033-min(max(b.x-.46,b.y),.08-max(c.x,c.y));
}

float M(float3 a)
{
    float3 b=abs(frac(a*4+.5)-.5)*.25;
    return max(max(max(b.x,b.y),b.z)-.08,max(L(a)-.01,.012-length(frac(a*25)-.5)*.04));
}

float N(float3 a)
{
    return min(min(min(M(a),M(a.zyx)),M(a.zxy)),min(min(L(a),L(a.zyx)),L(a.zxy)));
}

float O(float3 a)
{
    float4 b=float4((frac(a*.2+.5)-.5)*4,1);
    /*
    for(int i=0; i<4; ++i){
        b.xyz=clamp(b.xyz,-1.0,1.0)*2-b.xyz;
        b*=clamp(max(.21/dot(b.xyz,b.xyz),.21),0.0,1.0)*-15.7;
    }
    */
    {
        b.xyz=clamp(b.xyz,-1.0,1.0)*2-b.xyz;
        b*=clamp(max(.21/dot(b.xyz,b.xyz),.21),0.0,1.0)*-15.7;
    }
    {
        b.xyz=clamp(b.xyz,-1.0,1.0)*2-b.xyz;
        b*=clamp(max(.21/dot(b.xyz,b.xyz),.21),0.0,1.0)*-15.7;
    }
    {
        b.xyz=clamp(b.xyz,-1.0,1.0)*2-b.xyz;
        b*=clamp(max(.21/dot(b.xyz,b.xyz),.21),0.0,1.0)*-15.7;
    }
    {
        b.xyz=clamp(b.xyz,-1.0,1.0)*2-b.xyz;
        b*=clamp(max(.21/dot(b.xyz,b.xyz),.21),0.0,1.0)*-15.7;
    }
    a=b.xyz/b.w*5;
    return max(length(a)-1.0,N(a))*.25;
}

float P(float3 a)
{
    float3 b=abs(a);
    return max(max(max(b.x,b.y),b.z),max(max(length(b.xy),length(b.yz)),length(b.zx))-.2)-1.0;
}

float Q(float3 a)
{
    return max(abs(length(a*float3(1,1,.3))-.325)-.025,-a.z);
}

float R(float3 a)
{
    float3 b=abs(a);
    return max(b.y,dot(float3(.87,.5,0.0),b))-1;
}

float S(float3 a)
{
    return max(max(abs(length(a-float3(0,0,5))-5)-.05,R(a)),a.z-2);
}

float T(float3 a)
{
#if z(1)
    return max(K(a)-.201,O(a))
#elif z(2)
    float3 b=a*20;
    b.y+=A*5*(frac(dot(floor(b),float3(1,0,1))*3.1415926546)-.5);
    float3 c=F((frac(b.zxy)-.5)*.05,A*8*(frac(dot(floor(b),float3(3.1415926546)))-.5)),
    e=abs(frac(a+float3(.5,.5,0))-.5);
    a=F(a,A*.025*(frac((a.z*2-frac(a.z*2))*.437)-.5));
    float d=K(a);
    return min(max(min(max(d-.201,O(a)),.299-d),length(a)-20),max(max(e.x,e.z)-.05,min(max(length(c)-.006,L(c*10)*.1-.0002),.04)))
#elif z(4)
    float b=a.z*2-frac(a.z*2);
    a=H(F(a,A*.8*(frac(b*.347)-.5)));
    float d=abs(frac(a.z*2)-.5)*.5;
    return min(max(min(N(a+lerp(float3(.7,.875,.5),float3(.9,.925,.3),frac(float3(.37,.53,1)*b))),N(a/1.3+lerp(float3(.7,.7,.5),float3(.9,.925,.3),frac(float3(.71,.87,1)*b)))*1.3),d-.225),.275-d)
#elif z(8)
    a=H(a);
    float d=length(a);
    return max(max(J(a*.2)*5-.03,.015-N((frac(a*4+.2)-.5)*.25)),max(min(d-4,5.9-d),1.5-d))
#elif z(16)
    float3 b=I(a)*20,c=H(b*2+float3(0,0,2))-float3(1.4,0,0),d=b;
    d.y=abs(d.y);
    return min(min(min(min(max(R(d*4-float3(2,5,0))*.25,abs(d.z)-1),S(d.yzx*float3(1,.5,.5)*1.5+float3(.3,0,0))/1.5),max(min(.1-abs(d.x),-d.z),S(float3(0,0,1)-d.xzy*float3(1,.5,.5)))),min(min(max(P(c),-P(c*1.2+float3(0,0,1.5))/1.2),Q(c+float3(0,0,1.5))),Q(float3(abs(c.xy),c.z)-float3(.5,.5,-1.5)))*.5)*.05,.15-abs(a.x))
#else
    float3 b=(a-float3(.1,.21,sin(A*.025)*3))*5;
    b.y+=(frac(floor(b.z)*3.1415926546)-.5)*3.1415926546;
    float3 c=floor(b)+.5;
    float4 d=float4(normalize(sin(c*float3(1,2,3)))*sin(A*.5),cos(A*.5));
    float e=d.x,f=d.y,g=d.z,h=d.w;
    b=abs(mul( transpose(float3x3(.5-f*f-g*g,e*f-h*g,e*g+h*f,e*f+h*g,.5-e*e-g*g,f*g-h*e,e*g-h*f,f*g+h*e,.5-e*e-f*f))*2, (b-c)));
    b.xy+=frac(c.zz*c.yz*float2(.11,.31))*.095;
    return min(max(max(b.x,b.y),b.z)-.1,.3)*.2
#endif
;
}

float U(float3 a)
{
#if z(7)
    return abs(frac(a.z+z(4)*.5)-.5)
#elif z(8)
    a=H(a);
    float d=length(a);
    return abs(max(min(d-4,5.95-d),J(a*.4)*2.5-.08+d*.018))
#elif z(16)
    return .15-abs(a.x);

#else
    return abs(max(.02-L(a),O(a)))
#endif
    ;
}

float3 V(float a,float3 b,float c)
{
   a*=c;
    return 1/((1+2*b/a+b*b/(a*a))*c+.0001);
}

float3 W(float3 a,float b,float c,float d)
{
    float3 e=(V(.01,abs(a),d)*2+V(.05,float3(length(a.yz),length(a.zx),length(a.xy)),d)*5)*(sin(A*float3(2.1,1.3,1.7)+b*10)+1);
    return(e*7+e.yzx*1.5+e.zxy*1.5)*max(1.0-c*200.0/d,0.0)/d*(100-z(2)*30-z(32)*80-z(16)*88);
}

float X(float3 a,float t,float b)
{
    float c=frac(t+b),e=t-c;
    float3 f=Z(e)*float3(0,1,1)+sin(float3(0,23,37)*e),
    g=normalize(sin(float3(0,17,23)*e))*8,
    h=f+g+float3(sin(e*53)*.15,0,0),
    j=f-g+float3(sin(e*73)*.15,0,0),
    k=lerp(h,j,c-.15),
    l=lerp(h,j,c+.15);
    t=dot(a-k,l-k)/dot(l-k,l-k);
    return length((t<0?k:t>1?l:k+t*(l-k))-a);
}

float4 Y(float3 a,float b,float t)
{
    float3 c=I(a)*20,d=float3(length(c+float3(-.35,.57,2)),length(c+float3(-.35,-.57,2)),length(c+float3(.7,0,2))),e=V(.2,d,b),f=float3(X(a,t,0),X(a,t,.3),X(a,t,.6)),g=V(.001,f,b);
    return float4((e.x+e.y+e.z)*float3(30,75,150)*(E()+1)+(g.x+g.y+g.z)*float3(1,.1,.2)*5000,min(min(min(d.y,d.z),d.x)*.05,min(min(f.y,f.z),f.x)));
}



struct ia_out
{
    float4 vertex : POSITION;
};

struct vs_out
{
    float4 vertex : SV_POSITION;
    float3 B : TEXCOORD0;
    float3 C : TEXCOORD1;
};

struct ps_out
{
    float4 color : COLOR0;
};

vs_out vert(ia_out I)
{
    vs_out O;
    I.vertex.xy *= 2.0;
    O.vertex = I.vertex;

    float3 a=zv(2)*normalize(sin(A*.001*float3(21,11,17)))*20.1+zv(16)*Z(A)+zv(45)*(float3(0,0,sin(A*.025))*(5+zv(4)*15+zv(8)*7)+sin(A*.001*float3(21,11,17))*(.01+zv(11)*.04)),
    b=normalize(zv(2)*(sin(A*.001*float3(26,106,62))-a*.05)+zv(16)*(float3(0,-sin((A+sin(A*.2)*4)*.5+A*.1),(A+sin(A*.2)*4)*1.6+.5)-a)+zv(45)*(sin(A*.002*float3(13,53,31))*50+float3(0,0,sin(A*.05)*5)-a)),
    c=normalize(cross(b,sin(A*.001*float3(31,17,29))));
    float d=A*(1+zv(16)*4);
    for(int i=0;i<20; ++i) {
        float t=A-i*.1;
        float4 y=Y(Z(t),25,t);
        d+=zv(16)*sin((y.w+t)*5)*y.x*.05*exp(i*-.25);
    }
    float3 e=normalize(float3(sin(float2(.53,.47)*d)*4+sin(float2(.91,1.1)*d)*2+sin(float2(2.3,1.7)*d),200)),
    f=normalize(cross(e,float3(sin(d),50,0)));
    O.B = a;
    O.C = mul(transpose(float3x3(c,cross(c,b),b)), (f*I.vertex.x*1.78+cross(f,e)*I.vertex.y+e*1.4));
    return O;
}

ps_out frag(vs_out I)
{
    float3 B = I.B;
    float3 C = I.C;

    float3 a=normalize(C),c=float3(1),e=B,f=a,g=e,b=g*0,s=float3(1,-1,-1)*.0005;
    float4 l=float4(B,1),k=l*0,j=k,h=j;
    int m=1;
    float t=0,o=1,p=1,q=D(C)*.01+.99,n;
    for(int i=0; i<64+z(1)*16+z(16)*32-z(32)*32; ++i) {
        g=e+f*t;
        float d=T(g);
        if(d<(t*5+1)*.0001) {
            float3 u=normalize(T(g+s)*s+T(g+s.yyx)*s.yyx+T(g+s.yxy)*s.yxy+T(g+s.xxx)*s.xxx);
            float r=pow(abs(1-abs(dot(u,f))),5.0)*.9+.1;
            o+=t*p;
            p=p*5/r;
            e=g+u*.0001;
            f=reflect(f,u);
            t=0;
            float v=dot(u,u);
            if(v<.9||1.1<v||v!=v)u=float3(0);
            if(m<4){
                h=j;
                j=k;
                k=l;
                l=float4(g,max(floor(o),1.0)+clamp(r,.001,.999));
                ++m;
            }
        }
        else
            t=min(t+d*q,100.0);
    }
    if(m<4) {
        h=j;
        j=k;
        k=l;
        l=float4(g,o+t*p);
        ++m;
    }
    {
        int a=m;
        for(int i=0; i<4; ++i)
            if(a<4) {
                h=j;
                j=k;
                k=l;
                ++a;
            }
    }
    e=h.xyz;
    f=normalize(j.xyz-h.xyz);
    n=length(j.xyz-h.xyz);
    t=0;
    q=D(C)*.1+.8+z(11)*.1;
    o=1;
    p=0;
    for(int i=0; i<64+z(1)*16+z(16)*32-z(32)*32; ++i) {
        if(t>n) {
            if(m<3) break;
            h=j;
            j=k;
            k=l;
            --m;
            e=h.xyz;
            f=normalize(j.xyz-h.xyz);
            n=length(j.xyz-h.xyz);
            t=0;
            if(n<.0001) break;
            float r=frac(h.w);
            o=h.w-r;
            p=(floor(j.w)-o)/n;
            c*=lerp(float3(.17,.15,.12),float3(1),r);
        }
        g=e+f*t;
#if z(16)
        float4 y=Y(g,o+p*t,A);
#endif
        float u=U(g);
#if z(16)
        u=min(u,y.w);
#endif
        g-=
#if z(7)
            float3(0,0,sign(frac(g.z)-.5))
#else
            normalize(U(g+s)*s+U(g+s.yyx)*s.yyx+U(g+s.yxy)*s.yxy+U(g+s.xxx)*s.xxx)
#endif
        *u;
        float v=sin(A*.05+g.z)*.5,w=u*q+z(32)*.0005+z(31)*.001;
        float3 x=G(
#if z(12)
            H(g)
#else
            g
#endif
            ,v);
        b+=(W(x,v,u,o+p*t)+W(x,v,u,o+p*t+50+z(8)*50)
#if z(16)
            +y.xyz
#endif
            )*c*w;
        c*=pow(.7,w);
        t+=w;
    }

    ps_out O;
    O.color = float4(pow(b,float3(.45))-z(1)*max(A*.2-8.0,0.0),1.0);
    return O;
}
