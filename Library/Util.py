import random, string

def get_random_emails():
    a = ''.join(random.choice(string.ascii_lowercase + string.digits) for i in range(16))
    email = a + '@' + 'gmail.com'
    return email