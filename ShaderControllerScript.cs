using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static Unity.Mathematics.math;


public class ShaderControllerScript : MonoBehaviour
{

    public Material material;

    float red = 0.9f;
    float green = 0.5f;
    float blue = 0.5f;

    float alpha = 1.0f;

    Color Colour;

    
    // Start is called before the first frame update
    void Start()
    {

        //Colour = new Color(red, green, blue,alpha);
        //material.SetColor("_Colour", Colour);
        





    }

    // Update is called once per frame
    void Update()
    {

        red = transform.position.x  / 255;
        green = transform.position.y / 255;
        blue = transform.position.z  / 255;

        Colour = new Color(red, green, blue, alpha);
        material.SetColor("_Colour", Colour);





    }
}
