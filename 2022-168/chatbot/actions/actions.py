# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions


# This is a simple example for a custom action which utters "Hello World!"
import json
from typing import Any, Text, Dict, List

import requests
import yaml
from rasa_sdk.events import SlotSet
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.knowledge_base.storage import InMemoryKnowledgeBase
from rasa_sdk.knowledge_base.actions import ActionQueryKnowledgeBase

with open('application.yml') as f:
    application_yml = yaml.safe_load(f)

knowledge_url = application_yml['api']['disease']['url']
Headers = {'Authorization': 'Bearer k4cssi7npb3j5s2tddehsrqrhjr8iohg'}


class ActionInquireDiseases(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_inquire_diseases"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        current_disease = next(
            tracker.get_latest_entity_values("disease"), None)

        current_disease = str(current_disease).lower().replace(" ", "")
        if (current_disease != None):
            SlotSet("disease", current_disease)

        # Opening JSON file
        f = open('knowledge_base.json')

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        check = False

        # Iterating through the json
        # list
        for i in data['diseases']:
            if (i['name'] == current_disease):
                check = False
                dispatcher.utter_message(i['description'])
                break
            else:
                check = True

        if check:
            check = False
            dispatcher.utter_message(
                text="Sorry, we wouldn't be able to find that disease. Please check again!")

        # Closing file
        f.close()

        return []


class ActionInquireSpreading(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_inquire_spreading"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        current_disease = next(
            tracker.get_latest_entity_values("disease"), None)
        if (current_disease != None):
            current_disease = str(current_disease).lower().replace(" ", "")
            SlotSet("disease", current_disease)
        else:
            current_disease = tracker.get_slot("disease")
            current_disease = str(current_disease).lower().replace(" ", "")

        # Opening JSON file
        f = open('knowledge_base.json')

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        # Iterating through the json
        # list
        for i in data['diseases']:
            if (i['name'] == current_disease):
                if (i['spread']):
                    dispatcher.utter_message(
                        'Of course, yes ' + current_disease + ' disease is spreading')
                else:
                    dispatcher.utter_message(
                        'No, ' + current_disease + ' disease is not spreading')
        # Closing file
        f.close()

        return []


class ActionInquireSolutions(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_inquire_solutions"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        current_disease = next(
            tracker.get_latest_entity_values("disease"), None)

        if (current_disease != None):
            current_disease = str(current_disease).lower().replace(" ", "")
            SlotSet("disease", current_disease)
        else:
            current_disease = tracker.get_slot("disease")
            current_disease = str(current_disease).lower().replace(" ", "")

        if (current_disease == application_yml['type']):
            response = requests.get(knowledge_url + 'solutions_for_pestattack?name=' + current_disease, headers=Headers).json()
        else:
            response = requests.get(knowledge_url + 'solutions_for_diseases?name=' + current_disease, headers=Headers).json()

        dispatcher.utter_message(
            'Solutions for the ' + current_disease + ' disease.')
        index = 1
        solu = ""
        solu_arrya = []


        for i in response['results']:
            for j in i['tag']:
                solu_arrya.append(str(index) + ') ' + j['v_id'].capitalize())
                index = index + 1
            break
        solu = "\n".join(solu_arrya)
        dispatcher.utter_message(solu)

        return []


class ActionInquireSymptoms(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_inquire_symptoms"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

        current_disease = next(
            tracker.get_latest_entity_values("disease"), None)

        if (current_disease != None):
            current_disease = str(current_disease).lower().replace(" ", "")
            SlotSet("disease", current_disease)
        else:
            current_disease = tracker.get_slot("disease")
            current_disease = str(current_disease).lower().replace(" ", "")

        if (current_disease == application_yml['type']):
            response = requests.get(knowledge_url + 'symptoms_of_pestattack?name=' + current_disease, headers=Headers).json()
        else:
            response = requests.get(knowledge_url + 'symptoms_of_diseases?name=' + current_disease, headers=Headers).json()

        dispatcher.utter_message(
            'Symptoms of the ' + current_disease + ' disease.')

        index = 1
        symp = ""
        sym_arrya = []

        for i in response['results']:
            for j in i['tag']:
                sym_arrya.append(str(index) + ') ' + j['v_id'].capitalize())
                index = index + 1
            break
        symp = "\n".join(sym_arrya)
        dispatcher.utter_message(symp)

        return []


class ActionGetPineappleDiseases(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_get_pineapple_diseases"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Opening JSON file
        f = open('knowledge_base.json')

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        # Iterating through the json
        # list
        dispatcher.utter_message(
            'These are the main diseases in pineapple cultivation.')



        dis = ""
        dis_arrya = []
        index = 1

        response = requests.get(knowledge_url + 'all_diseases', headers=Headers).json()

        for i in response['results']:
            for j in i['tag']:
                dis_arrya.append(str(index) + ') ' +
                                 j['attributes']['name'].capitalize() + ' disease.')
                index = index + 1
            break


        response = requests.get(knowledge_url + 'all_pestattacks', headers=Headers).json()

        for i in response['results']:
            for j in i['tag']:
                dis_arrya.append(str(index) + ') ' +
                                 j['attributes']['name'].capitalize() + ' attack.')
                index = index + 1
            break

        print(dis_arrya)

        dis = "\n".join(dis_arrya)
        dispatcher.utter_message(dis)

        # Closing file
        f.close()

        return []


class ActionRemindWatering(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_remind_to_water"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        time = next(
            tracker.get_latest_entity_values("time"), None)

        task = next(
            tracker.get_latest_entity_values("task"), None)

        time_param = next(
            tracker.get_latest_entity_values("time_param"), None)

        dispatcher.utter_message(
            '& I will remind you to water the plants in ' + time + ' ' + time_param)

        return []


class ActionRemindFertilizing(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_remind_to_fertile"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        time = next(
            tracker.get_latest_entity_values("time"), None)

        task = next(
            tracker.get_latest_entity_values("task"), None)

        time_param = next(
            tracker.get_latest_entity_values("time_param"), None)

        dispatcher.utter_message(
            '& I will remind you to firtile the plants in ' + time + ' ' + time_param)

        return []


class ActionGetFertilizers(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_tell_about_fertilizers"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Opening JSON file
        f = open('knowledge_base.json')

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        # Iterating through the json
        # list
        index = 1
        fertilizers = []
        dispatcher.utter_message('Fertilizers')
        for i in data['fertilizers']:
            fertilizers.append(str(index) + ') ' + i['name'].capitalize())
            index = index + 1
            fer = "\n".join(fertilizers)
        dispatcher.utter_message(fer)

        # Closing file
        f.close()

        return []


class ActionApplyFertilizers(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_apply_fertilizer"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Opening JSON file
        f = open('knowledge_base.json')

        current_fertilizer = next(
            tracker.get_latest_entity_values("fertilizer"), None)

        if (current_fertilizer != None):
            current_fertilizer = str(current_fertilizer).lower().replace(" ", "")
            SlotSet("fertilizer", current_fertilizer)
        else:
            current_fertilizer = tracker.get_slot("fertilizer")
            current_fertilizer = str(current_fertilizer).lower().replace(" ", "")

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        # Iterating through the json
        # list
        index = 1
        fertilizers = ''
        dispatcher.utter_message('Application of ' + current_fertilizer + '\n\n')
        for i in data['fertilizers']:
            if (i['name'] == current_fertilizer):
                fertilizers = i['method']
        dispatcher.utter_message(fertilizers)

        # Closing file
        f.close()

        return []


class ActionAmountFertilizers(ActionQueryKnowledgeBase):
    def __init__(self):
        knowledge_base = InMemoryKnowledgeBase("knowledge_base.json")
        super().__init__(knowledge_base)

    def name(self) -> Text:
        return "action_amount_fertilizers"

    def run(self, dispatcher: CollectingDispatcher,
            tracker: Tracker,
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
        # Opening JSON file
        f = open('knowledge_base.json')

        current_fertilizer = next(
            tracker.get_latest_entity_values("fertilizer"), None)

        if (current_fertilizer != None):
            current_fertilizer = str(current_fertilizer).lower().replace(" ", "")
            SlotSet("fertilizer", current_fertilizer)
        else:
            current_fertilizer = tracker.get_slot("fertilizer")
            current_fertilizer = str(current_fertilizer).lower().replace(" ", "")

        # returns JSON object as
        # a dictionary
        data = json.load(f)

        # Iterating through the json
        # list
        index = 1
        fertilizers = ''
        for i in data['fertilizers']:
            if (i['name'] == current_fertilizer):
                fertilizers = i['description']
        dispatcher.utter_message(fertilizers)

        # Closing file
        f.close()

        return []
