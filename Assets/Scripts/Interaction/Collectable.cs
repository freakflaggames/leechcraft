using UnityEngine;
public class Collectable : MonoBehaviour, IInteractable
{
    public Item Item;
    public int Amount;
    public void Interact(InteractionSystem interaction)
    {
        Inventory inventory = interaction.gameObject.GetComponent<Inventory>();

        if (inventory)
        {
            if (inventory.AddItem(Item, Amount))
            {
                Destroy(gameObject);
                interaction.ClearInteractable();
            }
        }
    }
}