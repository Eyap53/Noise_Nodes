//
// Description : FBM (Fractional Brownian Motion) shader for 2D using SimpleNoise.
//     License : Copyright (C) 2021 Lacour Mael.
//               Distributed under the MIT License. See LICENSE file.
// 

#include "../hlsl-noise/src/SimplexNoise3D.hlsl"

///
/// Hurst should be between 0 and 1 for a gain between 1 and 0.5.
///
void FbmSimplex3D_float(float3 input, float octavesCount, float hurst, float lacunarity, out float output)
{
    float gain = exp2(-hurst);
    float frequency = 1.0;
    float amplitude = 1.0;
    float totalAmplitude = amplitude;
    output = 0.0;
    for(int i = 0; i < (int)octavesCount; i++)
    {
        output += amplitude * snoise(frequency * input);
        amplitude *= gain;
        totalAmplitude += amplitude;
        frequency *= lacunarity;
    }
    output = output / totalAmplitude;
}
