using UnityEngine;
public class Collectable : MonoBehaviour, IInteractable
{
    public ItemObject Item;
    public int Amount;
    public void Interact(PlayerInteraction interaction)
    {
        interaction.ClearInteractable();
        if (interaction.PlayerInventory.AddItem(Item, Amount))
        {
            Destroy(gameObject);
        }
    }
}