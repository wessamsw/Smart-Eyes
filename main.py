import cv2
import numpy as np
import os
import face_recognition
from gtts import gTTS


folder = "Known_Persons"

Known_Images = []         # will contain Images read using cv2
persons_Names = []        # will contain Names without extensions 


Pers_Names_with_ext = os.listdir(folder)

#listdir() => getting the names of images that are in given folder (with their extensions)
#print(Pers_Names_with_ext)



#Read the Known_Images using openCV, then Split the images names from their extensions
#Simply => Here, we filling the (Known Images) List and (Persons_Names) List
for name in Pers_Names_with_ext:


    curr_img = cv2.imread(f'{folder}/{name}')
    Known_Images.append(curr_img)
    
    splitted_name = os.path.splitext(name)[0]
    persons_Names.append(splitted_name)


#print(Known_Images)


def faces_encode(images):
    encoded_faces = []
    
    for image in images:
        img = cv2.cvtColor(image,cv2.COLOR_BGR2RGB)
        encoded_img = face_recognition.face_encodings(img)[0]
        encoded_faces.append(encoded_img)

    return encoded_faces


encoded_Known_Faces = faces_encode(Known_Images) 
#print(encoded_Known_Faces)

face_names = []
    
capture = cv2.VideoCapture(0)
recognized_text = []


while True:
    
    isRead, img = capture.read()

    resized_img = cv2.resize(img,(0,0),None,0.25,0.25)
    resized_img = cv2.cvtColor(resized_img,cv2.COLOR_BGR2RGB)

    face_locations = face_recognition.face_locations(resized_img)
    encoded_frame = face_recognition.face_encodings(resized_img,face_locations)

    #print(face_location)
    face_names = []
    for face_encoding in encoded_frame:
            
        matche_booleans = face_recognition.compare_faces(encoded_Known_Faces,face_encoding,0.5)
        print(matche_booleans)
       
        face_distances = face_recognition.face_distance(encoded_Known_Faces, face_encoding)
        print(face_distances)

        best_match_index = np.argmin(face_distances)

        if matche_booleans[best_match_index]:
            name = persons_Names[best_match_index]

        face_names.append(name)


    print(face_names)


    for (top, right, bottom, left), name in zip(face_locations, face_names):


        top *= 4
        right *= 4
        bottom *= 4
        left *= 4
    

        cv2.rectangle(img,(left,top),(right,bottom),(0,255,0),2)
        cv2.rectangle(img,(left,bottom-35),(right,bottom),(0,255,0),cv2.FILLED)
        
        cv2.putText(img,name,(left+6,bottom-6),cv2.FONT_HERSHEY_COMPLEX,1,(255,255,255),2)

    


    #Play known persons names as sound (using gTTS and OS)

    for person in face_names:
        
        if ( person not in recognized_text):

            tts = gTTS(text=f"{person} is here", lang='en')
        
            text = f"recognized_text_{person}.mp3"
            tts.save(text)
            os.system(text)
            recognized_text.append(person)

    cv2.imshow("Face Recognition",img)
    cv2.waitKey(1)
    

