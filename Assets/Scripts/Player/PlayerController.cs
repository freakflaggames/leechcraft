using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public float MoveSpeed;
    public float TurnSpeed;

    CharacterController controller;
    PlayerInput input;
    private void Start()
    {
        controller = GetComponent<CharacterController>();
        input = GetComponent<PlayerInput>();
    }
    private void Update()
    {
        Look();
        Move();
    }
    void Look()
    {
        if (input.MoveDirection != Vector3.zero)
        {
            //transform input coordinates to isometric direction
            var matrix = Matrix4x4.Rotate(Quaternion.Euler(0,45,0));
            var skewedInput = matrix.MultiplyPoint3x4(input.MoveDirection);
            var relative = (transform.position + skewedInput) - transform.position;
            var rot = Quaternion.LookRotation(relative, Vector3.up);

            //rotate player to where direction is pointing
            transform.rotation = Quaternion.RotateTowards(transform.rotation, rot, TurnSpeed * Time.deltaTime);
        }
    }
    void Move()
    {
        //move player forward if move input is held down
        var movePos = transform.forward * (input.MoveDirection.magnitude * MoveSpeed) * Time.deltaTime;
        controller.Move(movePos);
    }
}
