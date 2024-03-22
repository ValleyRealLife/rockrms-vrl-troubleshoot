# Workflow Attributes, JSON, and Appending to Array
Rock v14.2
- [Workflow Attributes, JSON, and Appending to Array](#workflow-attributes-json-and-appending-to-array)
- [One-sentence version](#one-sentence-version)
- [A more-detailed version](#a-more-detailed-version)
- [My failed attempt:](#my-failed-attempt)
- [My ratchet solution:](#my-ratchet-solution)

# One-sentence version
If I have a text-type Workflow Attribute containing a JSON string, and one of the values within the JSON string is an array, can I use a `Lava Run` Workflow Action in order to add a new value to that array?
<br><br>

# A more-detailed version
If I have a text-type Workflow Attribute with this key: `timtest`

And if `timtest` currently contains this text value:
```json
{
    "WorkflowId":29824,
    "RegistrationRegistrants":[
        {
            "WorkflowLoopIteration":0,
            "RegistrationRegistrantGuid":"036b632d-b076-47fe-8a24-2ab1eece014a",
            "RegistrationRegistrantPersonAliasGuid":"e64d220a-65fc-4da6-8490-c075c1703329"
        },
        {
            "WorkflowLoopIteration":1,
            "RegistrationRegistrantGuid":"042a892d-b087-23ab-6e13-7te3eebe023h",
            "RegistrationRegistrantPersonAliasGuid":"a90b361h-12wf-6bp1-9072-r806b2703240"
        }
    ]
}
```

Is there a way to use Lava in order to append a new value to `RegistrationRegistrants`, such that the resulting value of `timtest` would look like:
```json
{
    "WorkflowId":29824,
    "RegistrationRegistrants":[
        {
            "WorkflowLoopIteration":0,
            "RegistrationRegistrantGuid":"036b632d-b076-47fe-8a24-2ab1eece014a",
            "RegistrationRegistrantPersonAliasGuid":"e64d220a-65fc-4da6-8490-c075c1703329"
        },
        {
            "WorkflowLoopIteration":1,
            "RegistrationRegistrantGuid":"042a892d-b087-23ab-6e13-7te3eebe023h",
            "RegistrationRegistrantPersonAliasGuid":"a90b361h-12wf-6bp1-9072-r806b2703240"
        },
        {
            "WorkflowLoopIteration":2,
            "RegistrationRegistrantGuid":"028r652a-w163-21cr-9t39-6gr4epbh901m",
            "RegistrationRegistrantPersonAliasGuid":"i84k237j-44at-5tb2-1037-u971g1160604"
        }
    ]
}
```
<br><br>

# My failed attempt:
I've been testing this using the [Lava Tester](https://www.rockrms.com/rockshop/plugin/22/lava-tester) plugin. Since I didn't have a loaded Workflow with the `timtest` value, I'm using a `capture` in order to pretend I have it. This way I can at least continue testing as a proof of concept.
```Lava
{% capture timtestvar %}
{
    "WorkflowId":29824,
    "RegistrationRegistrants":[
        {
            "WorkflowLoopIteration":0,
            "RegistrationRegistrantGuid":"036b632d-b076-47fe-8a24-2ab1eece014a",
            "RegistrationRegistrantPersonAliasGuid":"e64d220a-65fc-4da6-8490-c075c1703329"
        },
        {
            "WorkflowLoopIteration":1,
            "RegistrationRegistrantGuid":"042a892d-b087-23ab-6e13-7te3eebe023h",
            "RegistrationRegistrantPersonAliasGuid":"a90b361h-12wf-6bp1-9072-r806b2703240"
        }
    ]
}
{% endcapture %}

{% capture newRegReg %}
{
    "WorkflowLoopIteration": {{ var_LoopIteration }},
    "RegistrationRegistrantGuid": "{{ var_RegistrationRegistrantGuid }}",
    "RegistrationRegistrantPersonAliasGuid": "{{ var_RegistrantPersonAliasGUID }}"
}
{% endcapture %}

{% assign existingJsonString = timtestvar %}
{% assign existingJsonObject = existingJsonString | FromJSON %}

{% assign newRegRegString = newRegReg %}
{% assign newRegRegObject = newRegRegString | FromJSON %}

{% assign updatedRegistrants = existingJsonObject.RegistrationRegistrants | AddToArray: newRegRegObject %}
```

Where I got stuck with this attempt is that I didn't know how to go from `updatedRegistrants` back to `timtestvar`
<br><br>

# My ratchet solution:
As long as the only things inside this JSON object are the `WorkflowId` and `RegistrationRegistrants`, the last two characters of `timtest` will always be `]}`, so I can use `RegExReplace` to remove `]}`, replace it with a `,`, and append the new value (as long as I bookend it with another `]}`)
```Lava
{% capture timtestvar %}
{"WorkflowId": {{ Workflow.Id }}, "RegistrationRegistrants": [{"WorkflowLoopIteration": {{ var_LoopIteration }}, "RegistrationRegistrantGuid": "{{ var_RegistrationRegistrantGuid }}", "RegistrationRegistrantPersonAliasGuid": "{{ var_RegistrantPersonAliasGUID }}"}]}
{% endcapture %}

{% capture LastTwoCharacters %}..${% endcapture %}

{% assign modified_string = timtestvar | RegExReplace: LastTwoCharacters, ',' %}

{{ modified_string }}{"RegistrationRegistrantGuid": "{{ var_RegistrationRegistrantGuid }}","RegistrationRegistrantPersonAliasGuid": "{{ var_RegistrantPersonAliasGUID }}"}]}
```

Note: The last two characters of the line starting with `{{ modified_string }}` are supposed to close the square-bracket and curly-bracket that was removed with the RegExReplace in the line that starts with `{% assign modified_string`.