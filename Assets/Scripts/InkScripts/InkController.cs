using System;
using Ink.Runtime;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

// This is a super bare bones example of how to play and display a ink story in Unity.
public class InkController : MonoBehaviour {
    public static event Action<Story> OnCreateStory;
	
    void Awake () {
		// Remove the default message
		RemoveChildren();

		story = new Story(inkJSONAsset.text);
		story.BindExternalFunction ("CutToBlack",() => {CutToBlack();});
		story.BindExternalFunction ("FadeToBlack",() => {FadeToBlack();});
		story.BindExternalFunction ("FadeFromBlack",() => {FadeFromBlack();});
		//SaveSystem.LoadDialogue();
	}

	void Start()
	{
		gameObject.SetActive(false);
	}

	// Creates a new Story object with the compiled story which we can then play!
	public void StartStory () {
		SaveSystem.LoadDialogue();
		story.ChoosePathString(knot);
        if(OnCreateStory != null) OnCreateStory(story);
		RefreshView();
	}
	
	// This is the main function called every time the story changes. It does a few things:
	// Destroys all the old content and choices.
	// Continues over all the lines of text, then displays all the choices. If there are no choices, the story is finished!
	void RefreshView () {

		// Remove all the UI on screen
		//RemoveChildren ();

		//Grey out existing text
		GreyText();
		
		//Remove choices
		RemoveChoices();

		Image divider = Instantiate(dividerPrefab) as Image;
		divider.transform.SetParent (container.transform, false);
		
		// Read all the content until we can't continue any more
		while (story.canContinue) {
			// Continue gets the next line of the story
			string text = story.Continue ();
			// This removes any white space from the text.
			text = text.Trim();
			// Display the text on screen!
			CreateContentView(text);
		}

		// Display all the choices, if there are any!
		if(story.currentChoices.Count > 0) {
			for (int i = 0; i < story.currentChoices.Count; i++) {
				Choice choice = story.currentChoices [i];
				Button button = CreateChoiceView (choice.text.Trim ());
				// Tell the button what to do when we press it
				button.onClick.AddListener (delegate {
					OnClickChoiceButton (choice);
				});
			}
		}
		// If we've read all the content and there's no choices, the story is finished!
		else {
			QuestSummary.Instance.UpdateQuestSummary();
			InGameMenus.Instance.UpdateUI();
			gameObject.SetActive(false);
		}

	}

	// When we click the choice button, tell the story to choose that choice!
	void OnClickChoiceButton (Choice choice) {
		if (!GameManager.Instance.paused)
        {
			story.ChooseChoiceIndex(choice.index);
			SaveSystem.SaveDialogue();
			RefreshView();
		}
	}

	// Creates a textbox showing the the line of text
	void CreateContentView (string text) {
		TextMeshProUGUI storyText = Instantiate (textPrefab) as TextMeshProUGUI;
		storyText.text = text;
		storyText.transform.SetParent (container.transform, false);
	}

	// Creates a button showing the choice text
	Button CreateChoiceView (string text) {
		// Creates the button from a prefab
		Button choice = Instantiate (buttonPrefab) as Button;
		choice.transform.SetParent (container.transform, false);
		
		// Gets the text from the button prefab
		TextMeshProUGUI choiceText = choice.GetComponent<TextMeshProUGUI> ();
		choiceText.text = text;

		// // Make the button expand to fit the text
		// HorizontalLayoutGroup layoutGroup = choice.GetComponent <HorizontalLayoutGroup> ();
		// layoutGroup.childForceExpandHeight = false;

		return choice;
	}

	// Destroys all the children of this gameobject (all the UI)
	public void RemoveChildren () {
		int childCount = container.transform.childCount;
		for (int i = childCount - 1; i >= 0; --i) {
			Destroy (container.transform.GetChild (i).gameObject);
		}
	}

	void RemoveChoices() {
		for (var i = container.transform.childCount - 1; i >= 0; i--)
        {
            if (container.transform.GetChild(i).gameObject.tag == "Choice")
            Destroy(container.transform.GetChild(i).gameObject);
        }
	}

	void GreyText() {
		for (var i = container.transform.childCount - 1; i >= 0; i--)
        {
			if (container.transform.GetChild(i).gameObject.tag == "Text")
			{
				GameObject choice = container.transform.GetChild(i).gameObject;
				TextMeshProUGUI text = choice.GetComponent<TextMeshProUGUI> ();
				text.color = new Color (0.25f,0.25f,0.25f, 1.0f);
			}
        }
	}

	void CutToBlack()
	{
		InkFade fade = InkFadeVFX.GetComponent<InkFade> ();
		fade.FadeIn(0,0,0);
	}

	void FadeToBlack()
	{
		InkFade fade = InkFadeVFX.GetComponent<InkFade> ();
		fade.FadeIn(0,0,1);
	}
	
	void FadeFromBlack()
	{
		InkFade fade = InkFadeVFX.GetComponent<InkFade> ();
		fade.FadeOut(0,0,1);
	}

	public void Save(ref InkSaveData data)
	{
		if (story)
        {
			data.state = story.state.ToJson();
			print("saved " + data.state);
		}
	}
	public void Load(InkSaveData data)
	{
		if (data.state != "")
        {
			story.state.LoadJson(data.state);
			print("loaded " + data.state);
        }
	}
	public void Erase(InkSaveData data)
    {
		data.state = "";
		print("erased " + data.state);
    }

	[SerializeField]
	public TextAsset inkJSONAsset = null;
	public Story story;
	public string knot;
	public string saveState;

	[SerializeField]
	private GameObject container = null;

	// UI Prefabs
	[SerializeField]
	private TextMeshProUGUI textPrefab = null;
	[SerializeField]
	private Button buttonPrefab = null;
	[SerializeField]
	private  Image dividerPrefab = null;

	// Fade to black
	[SerializeField]
	private  GameObject InkFadeVFX = null;
}

[System.Serializable]
public struct InkSaveData
{
	public string state;
}
