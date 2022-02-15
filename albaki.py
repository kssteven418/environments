import tensorflow as tf
gpus = tf.config.experimental.list_physical_devices('GPU')

tf.config.experimental.set_virtual_device_configuration(gpus[0], [tf.config.experimental.VirtualDeviceConfiguration(memory_limit=14000)])

x = tf.ones((1024, 1024))
while True:
    x = x / x
