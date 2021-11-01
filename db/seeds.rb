# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Dummy users 
intro_admin = "Hello, I'm a the owner of Webdog. Happy to have you! 
Our goal is to raise the standards in the dog-training industry as we advocate for the latest in scientific understanding of dog behavior while balancing this approach with twenty-first century ethics. A strong proponent of positive reinforcement dog training, we want to spread the message that people shouldn’t treat their dogs like members of a pack because these domesticated animals are a far cry from the ancient wolves they descended from. Also, rather than relying on a one-size-fits-all methodology, our fresh, positive approach allow people to tailor their training to their dog's unique personality and energy level, leading to quicker results and a much happier pet. "
intro_trainer = "Hello, I'm a certified dog trainer at Webdog. You can schedule classes with me. Regardless of your dog’s breed or behavior issues, you’ll be amazed at how quickly your dog responds to our training."
intro_client = "Hello, I'm a client at Webdog. Let's train my dog!"

admin1 = User.create!(email: 'admin1@gmail.com', password: 'pw', name: 'Tatiana Tuor', role: 'admin', introduction: intro_admin)
admin2 = User.create!(email: 'admin2@gmail.com', password: 'pw', name: 'Robin Pat', role: 'admin', introduction: intro_admin)
trainer1 = User.create!(email: 'trainer1@gmail.com', password: 'pw', name: 'Gina Metrailler', role: 'trainer', introduction: intro_trainer)
trainer2 = User.create!(email: 'trainer2@gmail.com', password: 'pw', name: 'Christian Zingg', role: 'trainer', introduction: intro_trainer)
trainer3 = User.create!(email: 'trainer3@gmail.com', password: 'pw', name: 'Lindsay Zingg', role: 'trainer', introduction: intro_trainer)
client1 = User.create!(email: 'client1@gmail.com', password: 'pw', name: 'Pamela', role: 'client', introduction: intro_client)
client2 = User.create!(email: 'client2@gmail.com', password: 'pw', name: 'Chaac', role: 'client', introduction: intro_client)
client3 = User.create!(email: 'client3@gmail.com', password: 'pw', name: 'Dima', role: 'client', introduction: intro_client)
client4 = User.create!(email: 'client4@gmail.com', password: 'pw', name: 'Vy', role: 'client', introduction: intro_client)
client5 = User.create!(email: 'client5@gmail.com', password: 'pw', name: 'Lancer', role: 'client', introduction: intro_client)
client6 = User.create!(email: 'client6@gmail.com', password: 'pw', name: 'Saint', role: 'client', introduction: intro_client)
client7 = User.create!(email: 'client7@gmail.com', password: 'pw', name: 'Talon', role: 'client', introduction: intro_client)
client8 = User.create!(email: 'client8@gmail.com', password: 'pw', name: 'Anvil', role: 'client', introduction: intro_client)
client9 = User.create!(email: 'client9@gmail.com', password: 'pw', name: 'Kestrel', role: 'client', introduction: intro_client)

# Dummy dogs
breed_list = ['German Shepherd', 'Swiss White Shepherd', 'Australian Shepherd', 
    'Goldren Retriever', 'Labrador Retriever', 'Husky', 'Chihuahua', 'Poodle', 'Mixed']
dog1 = Dog.create!(name: "Zuka", breed: breed_list[1], birthday: "2020-07-31", gender: 'Male', user: admin1)
dog2 = Dog.create!(name: "Billy", breed: breed_list[2], birthday: "2020-08-10", gender: 'Male', user: client1)
dog3 = Dog.create!(name: "Riley", breed: breed_list[1], birthday: "2020-01-23", gender: 'Female', user: trainer1)
dog4 = Dog.create!(name: "Plume", breed: breed_list[3], birthday: "2018-05-20", gender: 'Female', user: trainer2)
dog5 = Dog.create!(name: "Rookie", breed: breed_list[5], birthday: "2019-08-15", gender: 'Male', user: trainer3)

# Dummy blog posts
blog1 = Blogpost.create!(title: "Fear Periods in Dogs: A Survival Guide", meta: "Fear periods in dogs are completely normal, but are a common cause of concern among dog owners. What is a fear period, why and when do they happen, and most importantly, how do you get your dog through them? Let's dive in.",
                            body: "WHAT IS A FEAR PERIOD AND WHY DOES THIS HAPPEN IN DOGS?
                            Fear periods are temporary windows of developmental and cognitive change that typically occur 1-2 times during the first year of a dog's life. They often present with sudden behavioral changes that can be alarming to an unsuspecting dog owner, as they can involve the dog developing a 'spookiness' or suspicion towards new things.
                            These periods actually serve a functional purpose in your pup's development, so they aren't to be entirely dreaded. During these windows, your dog's brain is undergoing massive reorganization and change, and your dog's body is biologically preparing for more independence and self-sufficiency.
                            It's important for dogs to develop a pattern of things that are safe, and things that are to be avoided. But it's our job to ensure that those patterns aren't skewed by unpleasant experiences. We'll get to that shortly!
                            WHAT ARE THE MOST COMMON SYMPTOMS OF A FEAR PERIOD?
                            The signs of fear periods in dogs can vary greatly between dogs, but what they have in common is a sudden onset.",
                            user: admin1)
blog2 = Blogpost.create!(title: "Dog Won't Come When Called? Try This Easy Recall Training Method", meta: "Is there anything more frustrating than repeatedly chasing after a dog that won't come when called? Does your dog blatantly run away from you? Or perhaps they look up at you, then go back to what they were doing?",
                                body: "FIRST, LET'S TALK ABOUT WHY YOUR DOG ISN'T COMING WHEN CALLED.
                                There are a multitude of reasons why your recall might not be working, but let's go over the most common possibilities so we ensure that they don't affect the new training method we'll be teaching you.
                                You aren't rewarding the behavior well (or at all).
                                Ouch! This may be a frustrating realization to make, but is it possible that you're under-rewarding your dog's recall? When your dog does come when called, do they get a quick 'good boy' and a scratch behind the ear?
                                Unfortunately, verbal praise and/or physical affection are not sufficient rewards for coming when called.     
                                For the vast majority of dogs (unless you have a HIGHLY toy-driven dog), food rewards are the highest level of motivation you can use for your dog.
                                2. Your dog associates recall with punishment.
                                Contrary to popular belief, this doesn't (necessarily) mean that you have scared your dog or used a physical punishment when your dog did come back to you. Although, it's extremely important to note that if you do catch yourself in the habit of punishing your dog by yelling, spanking, or anything else unpleasant for having a slow recall, you are actually setting back your training process and poisoning your relationship and trust with your dog.
                                But let's talk about another form of punishment:
                                Taking away your dog's fun!
                                If you're always using your recall to call your dog away from their fun (playing with another dog, sniffing outside, etc), AND they aren't being properly rewarding for doing so, your dog is actually going to see the recall as a punishment.
                                3. You've added difficulty too quickly.
                                It's really important that when teaching your dog to come when called, you start in a low-distraction, indoor setting, and only increase your difficulty as your dog gains proficiency.
                                4. You're asking too often.
                                Even if you're doing a lot of the training right, if your dog hears 'Fido, come' constantly, he might eventually start to ignore it.
                                LET'S TEACH YOUR DOG TO COME WHEN CALLED
                                Now that we've established the big don'ts when it comes to teaching a reliable recall, let's get into a step-by-step plan for how to create a great recall with a new dog, or hit the reset button on a failing recall with your existing dog.",
                                user: trainer1)

# Dummy forum questions 
post1 = Post.create!(title: "Terrified of being attacked again while walking my dogs and now I feel like I'm neglecting my dogs. I don't know what to do. Help!",
                    body: "Back in January, I was walking my dogs when we were attacked by a loose dog (I won't mention the breed because I got death threats when I did on my social media). He would not relent and almost killed my smaller dog. A cop who was nearby had to shoot the dog several times and that was the only reason he stopped. It was like being attacked by a zombie.
                    I'm still traumatized. And I'm too afraid to walk my dogs regularly now because there are frequently loose dogs of the same type running around here. A few other people have had scary incidents. If I'm being honest, we have only been on four or five walks since January. I'm afraid to hire a walker and not be there to protect my dogs if they encounter another loose dog. I take my dogs to daycare once or twice a week to try to make it up to them, but daycare is expensive for two dogs, so I can't do it all the time, especially since pet insurance is expensive and I have that to make up for having limited finances.
                    My dogs are a corgi (6) and a Pomeranian (3). They don't have any behavioral issues, and we play in the house all the time as I'm disabled and don't work. They're not destructive and don't seem bored. But I feel like I'm neglecting them by not taking them out for walks. My yard is really small.
                    Am I abusing my dogs? Please be honest. I don't know what to do. I don't know anyone with dogs who doesn't go on walks. I am moving to a rural home next year and things should be better then, but what do I do in the meantime?",
                    user: client1)
post2 = Post.create!(title: "Genuinely lost as to what we are supposed to have our dogs chew on with seemingly everything being a risk of intestinal blockage",
                    body: "I have had a vet say before to never use Nylabones because the soft ones can break off in big chunks that lead to death, and the hard ones can break teeth (which Ive seen firsthand in my dad’s dog). I’ve also heard vets suggest nylabones are fine with supervision.
                    I have a teething Havanese puppy so Im looking into all options. Reviews on amazon are terrifying, with several things I have read advising to absolutely not buy this thing because it killed their dog or resulted in a huge vet bill, despite supervision. I’ve looked at gorilla chews and it’s the same thing, something that supposedly shouldn’t splinter does.
                    Is anyone here 100% confident that what their dog chews is safe or are these issues just things we have to accept the risk on and hope for the best?",
                    user: client2)
post3 = Post.create!(title: "My fiancé and I recently adopted an older dog (8m) and I don’t know what to expect",
                        body: "So we rescued this dog from my future brother in laws friend and this dog is also the dad of our current dog. I am not happy about how the dog was forced upon us (if you don’t take him he’s going to the pound) but we are both determined to give him a better home than where he came from. It’s only been one day and one night so far and he basically has not stopped panting. He has been really high energy. He isn’t neutered but we plan on doing that whenever available. He’s been playing with his toys a bunch and is almost a little restless. I played fetch with him to try and kill some energy and it helped for a little but then he picked back up. I don’t know if he’s so high energy because of his past and he is just excited to be able to play and get attention or if this is just how it’s going to be. He spent all day in a crate and even when they were home he might have been put on a 10 ft leash outside and his owner basically wrote him off after they got another dog bringing their total to three. I guess I don’t know what to expect from him and what will improve and what won’t and what I can do to give him a good home. Any advice or anything would be very helpful.",
                        user: client3)


