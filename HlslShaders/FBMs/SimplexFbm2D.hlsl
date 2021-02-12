//
// Description : FBM (Fractional Brownian Motion) shader for 2D using SimpleNoise.
//     License : Copyright (C) 2021 Lacour Mael.
//               Distributed under the MIT License. See LICENSE file.
// 

#include "../hlsl-noise/src/SimplexNoise2D.hlsl"

void SimplexFbm2D_float(float2 uv, float octavesCount, float hurst, float lacunarity, out float output)
{
    float gain = exp2(-hurst);
    float frequency = 1.0;
    float amplitude = 1.0;
    float totalAmplitude = amplitude;
    output = 0.0;
    for(int i = 0; i < (int)octavesCount; i++)
    {
        output += amplitude * snoise(frequency * uv);
        amplitude *= gain;
        totalAmplitude += amplitude;
        frequency *= lacunarity;
    }
    output = output / totalAmplitude;
}
